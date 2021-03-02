//
//  LoginViewController.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 25/02/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var createUsrBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        logInBtn.layer.cornerRadius = 10
        createUsrBtn.layer.cornerRadius = 10
        userTextField.attributedPlaceholder = NSAttributedString(string: "Enter your Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter your Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }

    @IBAction func loginButton(_ sender: UIButton) {
        if let email = userTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let e = error {
                    AlertView.instance.showAlert(title: "Error", message: e.localizedDescription, alertType: .failure)
                } else {
                    self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
                }
            }
        }
        passwordTextField.text = ""
    }
    @IBAction func createUserButton(_ sender: UIButton) {
    }
    

}

