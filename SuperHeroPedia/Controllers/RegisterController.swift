//
//  RegisterController.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 25/02/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import Foundation
import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerBtn.layer.cornerRadius = 10
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
//        AlertView.instance.showAlert(title: "Este es el titulo", message: "Hola Mundo", alertType: .failure)
    }
}
