import Foundation
import UIKit

class LoginViewModel {
    
    let network = Network()
    
    
    func validateLoginData(email: String?, password: String?, vc: UIViewController) {
        
        if let email = email {
            
            CurrentUser.currentUserEmail = email
        }
        network.networkUserArray()
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if email == user.email {
                        
                        if password == user.password {
                            
                            DispatchQueue.main.async {
                                
                                vc.performSegue(withIdentifier: "toHome", sender: nil)
                            }
                        }
                    }
                }
            } else {
                
                DispatchQueue.main.async {
                    
                    let alert = UIAlertController(title: "Usuário ou senha incorreto", message: "Revise seus dados para efetuar o login", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(ok)
                    vc.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
