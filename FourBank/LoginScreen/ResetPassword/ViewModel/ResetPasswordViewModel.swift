//
//  ResetPasswordViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/17/22.
//

import Foundation
import UIKit

class ResetPasswordViewModel {
    
    let network = Network()
    
    func validatePassword(email: String?, password: String?, confirm: String?, vc: UIViewController) {
        
        network.networkUser { userArray, error in
            if let userArray = userArray {
                for user in userArray {
                    if email == user.email {
                        if password == user.password {
                                
                                DispatchQueue.main.async {
                                    
                                    let alert = UIAlertController(title: "Senha inválida", message: "A senha digitada é a mesma que a senha atual.", preferredStyle: .alert)
                                    let ok = UIAlertAction(title: "Ok", style: .default)
                                    alert.addAction(ok)
                                    vc.present(alert, animated: true, completion: nil)
                                }
                            
                        } else if password != confirm{
                                
                                DispatchQueue.main.async {
                                    
                                    let alert = UIAlertController(title: "Senha inválida", message: "As senhas não estão condizentes.", preferredStyle: .alert)
                                    let ok = UIAlertAction(title: "Ok", style: .default)
                                    alert.addAction(ok)
                                    vc.present(alert, animated: true, completion: nil)
                                }
                            
                        } else {
                            
                            
                            
                            DispatchQueue.main.async {

                                let alert = UIAlertController(title: "Confirmação", message: "Senha alterada com sucesso!", preferredStyle: .alert)
                                let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
                                    
                                    vc.performSegue(withIdentifier: "resetPasswordToLogin", sender: self)
                                }
                                alert.addAction(ok)
                                vc.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }
            }
        }
    }
}
