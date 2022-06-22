//
//  TransferScreen3ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation
import UIKit


class PixScreen3ViewModel: UIViewController {
    
    let network = Network()
    
    func getAmount(amountValue: Double?) -> String {
        
        let amountDouble = amountValue ?? 0.00
        let amountString = String(amountDouble)
        let convertedString = amountString.replacingOccurrences(of: ",", with: ".")
        let amount = "R$ \(convertedString)"
        return amount 
    }
    
    func pixTransfer(amount: Double, pixKey: String, vc: UIViewController) {
        
        self.network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                var transferOk = false
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        if amount <= Double(user.accountBalance) {
                            
                            self.network.trasnferAmount(accountBalance: user.accountBalance - Int(amount), id: user.id)
                            transferOk = true
                            
                            DispatchQueue.main.async {
                            
                                let alert = UIAlertController(title: "Transferência ok", message: "Transferência ok.", preferredStyle: .alert)
                                let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
                                                vc.performSegue(withIdentifier: "PixScreenToHome", sender: self)
                                            }
                                alert.addAction(ok)
                                vc.present(alert, animated: true, completion: nil)
                            
                            }
                        } else {
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: "Saldo Insuficiente", message: "Saldo Insuficiente", preferredStyle: .alert)
                                let ok = UIAlertAction(title: "Ok", style: .default)
                                alert.addAction(ok)
                                vc.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }
                
                if transferOk {
                    
                    for receivingUser in userArray {
                        
                        if pixKey == receivingUser.email || pixKey == receivingUser.cpf || pixKey == receivingUser.cellphoneNumber{
                            
                            self.network.trasnferAmount(accountBalance: receivingUser.accountBalance + Int(amount), id: receivingUser.id)
                        }
                    }
                    
                }
            }
        }
    }
}
