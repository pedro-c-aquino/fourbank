import UIKit

class RegisterScreen2ViewModel {
    
    
    func validatFilledData(email: String, occupation: String, income: String, cellphone: String, vc: RegisterScreen2) {
        
        if email != "" && occupation != "" && income != "" && cellphone != "" {
            
            vc.performSegue(withIdentifier: "RegScreen2ToRegScreen3", sender: self)
        } else {
            
            let alert = UIAlertController(title: "Atenção", message: "Favor preencher todos os campos para continuar.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            vc.present(alert, animated: true, completion: nil)
        }
    }
}
