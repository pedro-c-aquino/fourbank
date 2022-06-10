//
//  ViewController.swift
//  FourBank
//
//  Created by Henrique Rodrigues Silva on 5/31/22.
//

import UIKit

class Login: UIViewController {
    
    @IBOutlet weak var emailTextField:    UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButton(_ sender: UIButton) {
            
            if (emailTextField.text == "" && passwordTextField.text == "") {
                
                print("Campos vazios.")
                
            } else if (emailTextField.text == "" || passwordTextField.text == ""){
                
                print("E-mail ou senha inválidos.")
                
            } else {
                
                performSegue(withIdentifier: "toHome", sender: nil)
            }
            
        }
        
        
        
        @IBAction func registerButton(_ sender: UIButton) {
            
            performSegue(withIdentifier: "toRegister", sender: nil)
        }
    

}

