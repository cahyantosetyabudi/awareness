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
            print("Email or password is empty")
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
        }
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("Error in request \(error?.localizedDescription)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(json)
            } catch {
                print("Error when seriliazation json")
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
}
