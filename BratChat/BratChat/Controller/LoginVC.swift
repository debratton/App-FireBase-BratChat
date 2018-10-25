//
//  ViewController.swift
//  BratChat
//
//  Created by David E Bratton on 10/25/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: RoundedButtons!
    @IBOutlet weak var signUpButton: RoundedButtons!
    
    var signUpMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func presentAlert(alert:String) {
        let alertVC = UIAlertController(title: "Error", message: alert, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion: nil)
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                if signUpMode {
                    // Sign Up
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if let error = error {
                            //print(error.localizedDescription)
                            self.presentAlert(alert: error.localizedDescription)
                        } else {
                            print("Sign up was successful :-)")
                            self.performSegue(withIdentifier: "moveToSnaps", sender: nil)
                        }
                    }
                    
                } else {
                    // Log In
                    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                        if let error = error {
                            //print(error.localizedDescription)
                            self.presentAlert(alert: error.localizedDescription)
                        } else {
                            print("Log in was successful :-)")
                            self.performSegue(withIdentifier: "moveToSnaps", sender: nil)
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        if signUpMode {
            // Switch to Log In Mode
            signUpMode = false
            loginButton.setTitle("Log In", for: .normal)
            signUpButton.setTitle("Switch to Sign Up", for: .normal)
        } else {
            // Switch to Sign Up Mode
            signUpMode = true
            loginButton.setTitle("Sign Up", for: .normal)
            signUpButton.setTitle("Switch to Log In", for: .normal)
        }
    }
    
}

