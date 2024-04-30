//
//  LoginViewController.swift
//  Prototype
//
//  Created by Şevval Gönül
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTf: UITextField!
    
    
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTf.isSecureTextEntry = true
        userNameTf.layer.cornerRadius = 10.0
        userNameTf.layer.cornerRadius = 10.0
        
    }
    

    @IBAction func buttonLoginClicked(_ sender: Any) {
        
    }
    
}
