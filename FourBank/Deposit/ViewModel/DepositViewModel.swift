//
//  Deposit1ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class DepositViewModel {
    
    let network = Network()
    
    func getAmountString(amount: Double) -> String {
        let amountConverted = String(format: "%.2f", amount)
        let amountString = "R$ " + amountConverted.replacingOccurrences(of: ".", with: ",")
        
        return amountString
    }
    
    func makeDeposit(amount: String) {
        
        let amountD = Double(amount) ?? 0.00
        self.network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        if amountD <= Double(user.accountBalance) {
                            
                            self.network.trasnferAmount(accountBalance: user.accountBalance + Int(amountD), id: user.id)
                        }
                    }
                }
            }
        }
    }
}
