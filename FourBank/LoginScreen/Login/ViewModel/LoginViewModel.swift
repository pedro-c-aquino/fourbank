//
//  LoginViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation
import UIKit

class LoginViewModel {
    
    let network = Network()
    
    func validateLoginData(email: String?, password: String?, vc: UIViewController) {
        
        if let email = email {
            
            CurrentUser.currentUserEmail = email
        }
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if email == user.email {
                        if password == user.password {
                            
                            DispatchQueue.main.async {
                                
                                vc.performSegue(withIdentifier: "toHome", sender: nil)
                            }
                            
                        } else {
                            
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: "Senha inválida", message: "A senha digitada não confere com a senha cadastrada para este usuário.", preferredStyle: .alert)
                                let ok = UIAlertAction(title: "Ok", style: .default)
                                alert.addAction(ok)
                                vc.present(alert, animated: true, completion: nil)
                            }
                        }
                    } else {
                        
                        DispatchQueue.main.async {
                            
                            let alert = UIAlertController(title: "Usuário não cadastrado.", message: "Este usuário não foi encontrado no sistema, cadastre-se para acessar o app.", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "Ok", style: .default)
                            alert.addAction(ok)
                            vc.present(alert, animated: true, completion: nil)
                        }
                    }
                }
            }
        }
    }
}
