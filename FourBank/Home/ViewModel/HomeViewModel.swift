//
//  HomeViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import UIKit

class HomeViewModel: UIViewController {
    
    let network = Network()
    
    func getAmount(amountDouble: Double?) -> String {
        
        let amountText = String(format: "%.2f", amountDouble ?? 0.00)
        let convertedString = amountText.replacingOccurrences(of: ".", with: ",")
        let amount = convertedString
        return amount
    }
    
    func showBalance(vc: Home) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        DispatchQueue.main.async {
                            vc.nameLabel.text = "Olá, \(user.name)"
                            vc.balanceLabel.text = "R$ \(String(format: "%.2f", Double(user.accountBalance)))".replacingOccurrences(of: ".", with: ",")
                        }
                    }
                }
            }
        }
    }
    
    func hideButtonTapped(vc: Home) {
        
        if vc.balanceLabel.isHidden {
            
            vc.balanceLabel.isHidden = false
            vc.hiddenBalanceLabel.isHidden = true
            vc.hideBalanceButton.image = UIImage(systemName: "eye.slash.fill")
        } else {
            
            vc.balanceLabel.isHidden = true
            vc.hiddenBalanceLabel.isHidden = false
            vc.hideBalanceButton.image = UIImage(systemName: "eye.fill")
        }
    }
    
}
