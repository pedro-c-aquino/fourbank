//
//  ResetPassword.swift
//  FourBank
//
//  Created by user220237 on 6/17/22.
//

import UIKit

class ResetPAssword: UIViewController {
    
    let network = Network()
    let resetViewModel = ResetPasswordViewModel()
    
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func resetPasswordButton(_ sender: UIButton) {
        
        let passwordInfo = resetViewModel.validatePassword(password: passwordTextField.text)
        if passwordInfo.validation {
            
            network.networkUser { userArray, error in
                if let userArray = userArray {
                    for user in userArray {
                        if self.passwordTextField.text == user.password {
                                
                                DispatchQueue.main.async {
                                    
                                    let alert = UIAlertController(title: "Senha inválida", message: "A senha digitada é a mesma que a senha atual.", preferredStyle: .alert)
                                    let ok = UIAlertAction(title: "Ok", style: .default)
                                    alert.addAction(ok)
                                    self.present(alert, animated: true, completion: nil)
                                }
                            
                        } else if self.passwordTextField.text != self.confirmPasswordTextField.text{
                                
                                DispatchQueue.main.async {
                                    
                                    let alert = UIAlertController(title: "Senha inválida", message: "As senhas não estão condizentes.", preferredStyle: .alert)
                                    let ok = UIAlertAction(title: "Ok", style: .default)
                                    alert.addAction(ok)
                                    self.present(alert, animated: true, completion: nil)
                                }
                            
                        } else {
                            
                            DispatchQueue.main.async {

                                let alert = UIAlertController(title: "Confirmação", message: "Senha alterada com sucesso!", preferredStyle: .alert)
                                let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
                                    
                                    self.performSegue(withIdentifier: "resetPasswordToLogin", sender: self)
                                }
                                alert.addAction(ok)
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }
            }
        }
    }
}
