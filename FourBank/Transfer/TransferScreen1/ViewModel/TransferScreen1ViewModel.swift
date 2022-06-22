//
//  TransferScreen1ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import Foundation

class TransferScreen1ViewModel {
    
    let network = Network()
    
    func getAmount(amountText: String?) -> Double {
        
        let amountString = amountText ?? "0.00"
        let convertedString = amountString.replacingOccurrences(of: ",", with: ".")
        let amount = Double(convertedString)
        return amount ?? 0.00
    }
    
    func changeBalance(vc: TransferScreen1) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        DispatchQueue.main.async {
                            
                            vc.balanceLabel.text = String(format: "%.2f", Double(user.accountBalance)).replacingOccurrences(of: ".", with: ",")
                        }
                    }
                }
            }
        }
    }
    
}
