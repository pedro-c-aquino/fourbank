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
        
        let loginInfo = loginViewModel.validateLoginData(email: emailTextField.text, password: passwordTextField.text)
        if loginInfo.validation {
            
            CurrentUser.currentUserEmail = loginInfo.email
            network.networkUser { userArray, error in
                if let userArray = userArray {
                    for user in userArray {
                        if CurrentUser.currentUserEmail == user.email {
                            if loginInfo.password == user.password {
                                
                                DispatchQueue.main.async {
                                    
                                    self.performSegue(withIdentifier: "toHome", sender: nil)
                                }
                            } else {
                                
                                DispatchQueue.main.async {
                                    
                                    let alert = UIAlertController(title: "Senha inválida", message: "A senha digitada não confere com a senha cadastrada para este usuário.", preferredStyle: .alert)
                                    let ok = UIAlertAction(title: "Ok", style: .default)
                                    alert.addAction(ok)
                                    self.present(alert, animated: true, completion: nil)
                                }
                            }
                        } else {
                            
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: "Usuário não cadastrado.", message: "Este usuário não foi encontrado no sistema, cadastre-se para acessar o app.", preferredStyle: .alert)
                                let ok = UIAlertAction(title: "Ok", style: .default)
                                alert.addAction(ok)
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }
            }
            
            print(network.userModel)
            
            

        }
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toRegister", sender: nil)
    }
}

