//
//  TransferScreen3ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class TransferScreen3ViewModel {
    
    let network = Network()
    
    func getAmountString(amount: Double) -> String {
        let amountConverted = String(format: "%.2f", amount)
        let amountString = "R$ " + amountConverted.replacingOccurrences(of: ".", with: ",")
        
        return amountString
    }
    
    func makeTransfer(amount: Double, agency: String, account: String, vc: UIViewController) {
        
        self.network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                var transferOk = false
                
                var accountDataMatch = false
                
                var loggedUser: UserModel? = nil
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        if amount <= Double(user.accountBalance) {
                            
                            transferOk = true
                            loggedUser = user
                        }
                    }
                }
                
                if transferOk {
                    
                    for receivingUser in userArray {
                        
                        if agency == receivingUser.agency {
                            
                            if account == receivingUser.account {
                                
                                accountDataMatch = true
                                if let loggedUser = loggedUser {
                                    
                                    self.network.trasnferAmount(accountBalance: loggedUser.accountBalance - Int(amount), id: loggedUser.id)
                                    self.network.trasnferAmount(accountBalance: receivingUser.accountBalance + Int(amount), id: receivingUser.id)
                                    DispatchQueue.main.async {
                                        
                                        let alert = UIAlertController(title: "Confirmação", message: "Transferência efetuada com sucesso!", preferredStyle: .alert)
                                        let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
                                            vc.performSegue(withIdentifier: "TrScreen3ToHome", sender: self)
                                        }
                                        alert.addAction(ok)
                                        vc.present(alert, animated: true, completion: nil)
                                    }
                                }
                            }
                        }
                    }
                } else {
                    
                    DispatchQueue.main.async {
                        
                        let alert = UIAlertController(title: "Saldo insuficiente", message: "Não possui saldo suficiente para realizar a transferência.", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Ok", style: .default)
                        alert.addAction(ok)
                        vc.present(alert, animated: true, completion: nil)
                    }
                }
                
                if !accountDataMatch {
                    
                    DispatchQueue.main.async {
                        
                        let alert = UIAlertController(title: "Dados inválidos", message: "Não foi possível encontrar conta com os dados especificados. Verifique e tente novamente.", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Ok", style: .default)
                        alert.addAction(ok)
                        vc.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
