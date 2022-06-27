import UIKit

class RegisterScreen1ViewModel {
    
    
    func validatFilledData(name: String, birthday: String, cpf: String, rg: String, vc: RegisterScreen1ViewController) {
        
        if name != "" && birthday != "" && cpf != "" && rg != "" {
            
            vc.performSegue(withIdentifier: "RegScreen1ToRegScreen2", sender: self)            
        } else {
            
            let alert = UIAlertController(title: "Atenção", message: "Favor preencher todos os campos para continuar.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            vc.present(alert, animated: true, completion: nil)
        }
    }
}
