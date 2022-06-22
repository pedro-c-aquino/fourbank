//
//  ResetPassword.swift
//  FourBank
//
//  Created by user220237 on 6/17/22.
//

import UIKit

class ResetPAssword: UIViewController {
    
    let resetViewModel = ResetPasswordViewModel()
    
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func resetPasswordButton(_ sender: UIButton) {
        
        resetViewModel.validatePassword(cpf: cpfTextField.text, password: passwordTextField.text, confirm: confirmPasswordTextField.text, vc: self)
            
        
    }
}
