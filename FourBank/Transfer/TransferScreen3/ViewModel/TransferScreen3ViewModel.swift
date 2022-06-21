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
    
    func makeTransfer(amount: Double, agency: String, account: String) {
        
        self.network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                var transferOk = false
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        if amount <= Double(user.accountBalance) {
                            
                            self.network.trasnferAmount(accountBalance: user.accountBalance - Int(amount), id: user.id)
                            transferOk = true
                        }
                    }
                }
                
                if transferOk {
                    
                    for receivingUser in userArray {
                        
                        if agency == receivingUser.agency {
                            
                            if account == receivingUser.account {
                                
                                self.network.trasnferAmount(accountBalance: receivingUser.accountBalance + Int(amount), id: receivingUser.id)
                            }
                        }
                    }
                    
                }
            }
        }
    }
        
}
