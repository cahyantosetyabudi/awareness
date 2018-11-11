//
//  LandingViewController.swift
//  awareness
//
//  Created by Cahyanto Setya Budi on 11/6/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = UserDefaults.standard
        if preferences.object(forKey: "token") != nil {
            let token = preferences.object(forKey: "token") as! String
            checkToken(token)

        }
        

    }

}

extension LandingViewController {
    func checkToken(_ token: String) {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = false
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)

        let url = URL(string: "http://128.199.83.121:5021/secret")
        let sessionConfig = URLSessionConfiguration.default
        let bearer = "Bearer \(token)"
        sessionConfig.httpAdditionalHeaders = ["Authorization": bearer]
        let session = URLSession(configuration: sessionConfig, delegate: self as? URLSessionDelegate, delegateQueue: nil)

        let task = session.dataTask(with: url!) { (data, response, error) in
            self.removeActivityIndicator(activityIndicator)
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            if response.statusCode == 200 {
                self.segueToTabBar()
            }
            
        }
        task.resume()
        
    }
    
    func removeActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
    func segueToTabBar() {
        DispatchQueue.main.async {
            let mainTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
            self.present(mainTabBarController, animated: true, completion: nil)
        }
    }
}
