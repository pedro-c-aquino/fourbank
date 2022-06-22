//
//  TransferScreen3ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation

class PixScreen3ViewModel {
    
    let network = Network()
    
    func getAmount(amountValue: Double?) -> String {
        
        let amountDouble = amountValue ?? 0.00
        let amountString = String(amountDouble)
        let convertedString = amountString.replacingOccurrences(of: ",", with: ".")
        let amount = "R$ \(convertedString)"
        return amount 
    }
    
    func pixTransfer(amount: Double, pixKey: String) {
        
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
                        
                        if pixKey == receivingUser.email || pixKey == receivingUser.cpf || pixKey == receivingUser.cellphoneNumber{
                            
                            self.network.trasnferAmount(accountBalance: receivingUser.accountBalance + Int(amount), id: receivingUser.id)
                        }
                    }
                    
                }
            }
        }
    }
}
