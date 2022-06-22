//
//  Payment1ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class PaymentViewModel {
    
    let network = Network()
    
    func getAmountString(amount: Double) -> String {
        let amountConverted = String(format: "%.2f", amount)
        let amountString = "R$ " + amountConverted.replacingOccurrences(of: ".", with: ",")
        
        return amountString
    }
    
    func makePayment(amount: String, codBar: String, vc: UIViewController) {
        
        let amountD = Double(amount) ?? 0.00
        self.network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        if amount == "" || codBar == "" {
                            
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: "Atenção", message: "Algum campo não foi preenchido corretamente.", preferredStyle: .alert)
                                let ok = UIAlertAction(title: "Ok", style: .default)
                                alert.addAction(ok)
                                vc.present(alert, animated: true, completion: nil)
                            }
                        } else {
                        
                            if amountD <= Double(user.accountBalance) {
                                
                                self.network.trasnferAmount(accountBalance: user.accountBalance - Int(amountD), id: user.id)
                            }
                            
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: "Confirmação", message: "Pagamento efetuado com sucesso!", preferredStyle: .alert)
                                let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
                                    vc.performSegue(withIdentifier: "PaymentScreenToHome", sender: self)
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
