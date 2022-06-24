//
//  StatementScreenViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation
import UIKit

class StatementScreenViewModel {
    
    func formatBalance(balance: String?, vc: StatementScreen) {
        
            
        if let userArray = CurrentUser.userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        DispatchQueue.main.async {
                            
                            vc.balanceLabel.text = "R$ \(String(format: "%.2f", Double(user.accountBalance)))".replacingOccurrences(of: ".", with: ",")
                        }
                    }
                }
        }
    }
    
    func countTransfer()  -> Int {
        
        if let userArray = CurrentUser.userArray {
            
            for user in userArray {
                if CurrentUser.currentUserEmail == user.email {
                    return user.transfers.count
                }
            }
        }
        return 0
    }
    
    func saveTransfers(tableView: UITableView, cell: BalanceCell?, vc: StatementScreen, indexPath: IndexPath) {

        
        if let userArray = CurrentUser.userArray {
            
            for var user in userArray {
                
                if CurrentUser.currentUserEmail == user.email {
                    
                    user.transfers.reverse()
                    
                    DispatchQueue.main.async {
                        
                        
                        cell?.typeTransferLabel.text = user.transfers[indexPath.row].transferType
                        cell?.typeTransfer2Label.text = user.transfers[indexPath.row].transferType
                        cell?.amountLabel.text = String(user.transfers[indexPath.row].amount)
                        
                        if user.transfers[indexPath.row].amount > 0 {
                            
                            cell?.typeTransfer2Label.textColor = .green
                            cell?.realSignLabel.textColor = .green
                            cell?.amountLabel.textColor = .green
                            cell?.transferIconImageView.tintColor = .green
                        }
                        else {
                            
                            cell?.typeTransfer2Label.textColor = .red
                            cell?.realSignLabel.textColor = .red
                            cell?.amountLabel.textColor = .red
                            cell?.transferIconImageView.tintColor = .red
                        }
                    }
                }
            }
        }
    }
}
