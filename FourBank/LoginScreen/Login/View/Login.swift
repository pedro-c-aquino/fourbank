//
//  ViewController.swift
//  FourBank
//
//  Created by Henrique Rodrigues Silva on 5/31/22.
//

import UIKit

class Login: UIViewController {
    
    let loginViewModel = LoginViewModel()
    let network = Network()
    
    @IBOutlet weak var emailTextField:    UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        loginViewModel.validateLoginData(email: emailTextField.text, password: passwordTextField.text, vc: self)
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toRegister", sender: nil)
    }
}

