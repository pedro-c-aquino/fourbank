import UIKit

class RegisterScreen3ViewModel {
    
    
    func validatFilledData(street: String, city: String, state: String, neighborhood: String, number: String, vc: RegisterScreen3) {
        
        if street != "" && city != "" && state != "" && neighborhood != "" && number != "" {
            
            vc.performSegue(withIdentifier: "RegScreen3ToRegScreen4", sender: self)
        } else {
            
            let alert = UIAlertController(title: "Atenção", message: "Favor preencher todos os campos para continuar.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            vc.present(alert, animated: true, completion: nil)
        }
    }
}
