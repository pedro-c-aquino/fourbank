//
//  Payment1ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import Foundation
import UIKit

class PaymentViewModel {
    
    let network = Network()
    var paymentAmount: Double = 0.0
    
    func getAmountString(amount: Double) -> String {
        let amountConverted = String(format: "%.2f", amount)
        let amountString = "R$ " + amountConverted.replacingOccurrences(of: ".", with: ",")
        
        return amountString
    }
    
    func formatBalance(balance: String?, vc: Payment) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        DispatchQueue.main.async {
                            
                            vc.balanceLabel.text = "R$ \(String(format: "%.2f", Double(user.accountBalance)))".replacingOccurrences(of: ".", with: ",")
                        }
                    }
                }
            }
        }
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
                                
                                var transfers = user.transfers
                                
                                let currentTransfer = Transfer(amount: -amountD, transferType: "Pagamento")
                                transfers.append(currentTransfer)
                                self.network.addTransfer(id: user.id, transferData: TransferPutModel(accountBalance: user.accountBalance - Int(amountD), transfers: transfers))
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
