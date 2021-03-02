//
//  RegisterController.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 25/02/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import UIKit
import Firebase

class RegisterController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerBtn.layer.cornerRadius = 10
        passwordTextField.textContentType = .oneTimeCode
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authresult, error) in
                if let e = error {
                    AlertView.instance.showAlert(title: "ERROR", message: e.localizedDescription, alertType: .failure)
                } else {
                    AlertView.instance.showAlert(title: "Successful Registration!", message: "You have been successfully registered", alertType: .success)
                }
            }
        }
//        AlertView.instance.showAlert(title: "Este es el titulo", message: "Hola Mundo", alertType: .failure)
    }
}
