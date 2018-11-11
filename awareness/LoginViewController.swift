//
//  LoginViewController.swift
//  awareness
//
//  Created by Cahyanto Setya Budi on 11/6/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var login_token: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func emailTextField(_ sender: UITextField) {
        self.view.endEditing(true)
    }
    
    @IBAction func passwordTextField(_ sender: UITextField) {
        self.view.endEditing(true)
    }
    
    @IBAction func passwordFieldBeginEditing(_ sender: UITextField) {
        animateViewMoving(up: true, moveValue: 50)
    }
    
    @IBAction func passwordFieldEndEditing(_ sender: UITextField) {
        animateViewMoving(up: false, moveValue: 50)
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let email = emailField.text
        let password = passwordField.text
        if email!.isEmpty || password!.isEmpty {
            self.displayMesage("Email or Password is required")
        }
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = false
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)

        //Request http for authentication
        let url = URL(string: "http://128.199.83.121:5021/sign-in")
        let httpBody = ["email": email!, "password": password!] as [String: String]
        let session = URLSession.shared
        var request = URLRequest(url: url!)

        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: httpBody, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            self.displayMesage("Something gone wrong with server")
        }

        let task = session.dataTask(with: request) { (data, response, error) in
            self.removeActivityIndicator(activityIndicator)
            
            guard let data = data else {
                return
            }

            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                guard let json = jsonObject as? NSDictionary else {
                    return
                }
                if let token = json["token"] as? String {
                    self.login_token = token
                    let preferences = UserDefaults.standard
                    preferences.set(self.login_token, forKey: "token")
                    
                    self.segueToTabBar()
                } else {
                    self.displayMesage("Email or Password Wrong")
                }

            } catch {
                print("Error: \(error.localizedDescription)")
                self.removeActivityIndicator(activityIndicator)
            }

        }
        task.resume()
    }
    
}

extension LoginViewController {
    func animateViewMoving(up: Bool, moveValue: CGFloat) {
        let movementDuration: TimeInterval = 0.3
        let movement: CGFloat = (up ? -moveValue: moveValue)
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    func segueToTabBar() {
        DispatchQueue.main.async {
            let mainTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
            self.present(mainTabBarController, animated: true, completion: nil)
        }
    }
    
    func removeActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
    func displayMesage(_ messages: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Alert", message: messages, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
