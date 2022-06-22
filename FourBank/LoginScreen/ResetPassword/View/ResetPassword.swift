//
//  ResetPassword.swift
//  FourBank
//
//  Created by user220237 on 6/17/22.
//

import UIKit

class ResetPAssword: UIViewController {
    
    let resetViewModel = ResetPasswordViewModel()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func resetPasswordButton(_ sender: UIButton) {
        
        resetViewModel.validatePassword(email: emailTextField.text, password: passwordTextField.text, confirm: confirmPasswordTextField.text, vc: self)
            
        
    }
}
