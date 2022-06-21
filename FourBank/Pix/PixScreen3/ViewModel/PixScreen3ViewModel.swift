//
//  TransferScreen3ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation

class PixScreen3ViewModel {
    
    let network = Network()
    
    func getAmount(amountText: String?) -> Double {
        
        let amountString = amountText ?? "0.00"
        let convertedString = amountString.replacingOccurrences(of: ",", with: ".")
        let amount = Double(convertedString)
        return amount ?? 0.00
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
