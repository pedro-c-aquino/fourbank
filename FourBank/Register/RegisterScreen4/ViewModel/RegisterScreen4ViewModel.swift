import UIKit

class RegisterScreen4ViewModel {
    
    
    func checkPassword(password: String, confirmPassword: String, vc: RegisterScreen4 ) -> Bool {
        
        if password != "" && confirmPassword != "" {
            
            if password == confirmPassword {
                
                return true
            } else {
                
                let alert = UIAlertController(title: "Atenção", message: "As senhas devem ser iguais.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(ok)
                vc.present(alert, animated: true, completion: nil)
            }
        }
        let alert = UIAlertController(title: "Atenção", message: "Favor preencher todos os campos para continuar.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        vc.present(alert, animated: true, completion: nil)
        
        return false
    }
}
