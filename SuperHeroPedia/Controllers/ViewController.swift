//
//  ViewController.swift
//  SuperHeroPedia
//
//  Created by IDS Comercial on 25/02/21.
//  Copyright © 2021 Americo MQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var createUsrBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        logInBtn.layer.cornerRadius = 10
        createUsrBtn.layer.cornerRadius = 10
    }

    @IBAction func loginButton(_ sender: UIButton) {
    }
    @IBAction func createUserButton(_ sender: UIButton) {
    }
    

}

