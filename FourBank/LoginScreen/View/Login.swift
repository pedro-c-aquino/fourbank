//
//  ViewController.swift
//  FourBank
//
//  Created by Henrique Rodrigues Silva on 5/31/22.
//

import UIKit
import Firebase

class Login: UIViewController {
    
    let loginViewModel = LoginViewModel()
    
    @IBOutlet weak var emailTextField:    UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButton(_ sender: UIButton) {
        
        let loginInfo = loginViewModel.validateLoginData(email: emailTextField.text, password: passwordTextField.text)
        
        if loginInfo.validation {
            
            CurrentUser.currentUserEmail = loginInfo.email
            
            Auth.auth().signIn(withEmail: loginInfo.email, password: loginInfo.password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "toHome", sender: nil)
                }
            }
            
                
            }
            
        }
        
        
        
        @IBAction func registerButton(_ sender: UIButton) {
            
            performSegue(withIdentifier: "toRegister", sender: nil)
        }
    

}

