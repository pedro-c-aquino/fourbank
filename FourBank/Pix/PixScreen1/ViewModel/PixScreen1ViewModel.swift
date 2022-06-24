import Foundation
import UIKit

class PixScreen1ViewModel {
    
    let network = Network()
    
    
    func getAmount(amountText: String?) -> Double {
        
        let amountString = amountText ?? "0.00"
        let convertedString = amountString.replacingOccurrences(of: ",", with: ".")
        let amount = Double(convertedString)
        return amount ?? 0.00
    }
    
    
    func validateAmount(amount: String, vc: PixScreen1) {
        
        if amount != "" {
            
            vc.transferAmount = getAmount(amountText: amount)
            vc.performSegue(withIdentifier: "PixScreen1ToPixScreen2", sender: self)
        } else {
            
            let alert = UIAlertController(title: "Atenção", message: "Informar o valor do Pix", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func showBalance(vc: PixScreen1) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        DispatchQueue.main.async {
                            
                            vc.balanceLabel.text = "\(String(format: "%.2f", Double(user.accountBalance)))".replacingOccurrences(of: ".", with: ",")
                        }
                    }
                }
            }
        }
    }
}

