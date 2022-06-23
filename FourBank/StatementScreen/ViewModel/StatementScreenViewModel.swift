//
//  StatementScreenViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation
import UIKit

class StatementScreenViewModel {
    
    let network = Network()
    
    func formatBalance(balance: String?, vc: StatementScreen) {
        
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
    
    func countTransfer(tableView: UITableView, vc: StatementScreen) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                
                    if CurrentUser.currentUserEmail == user.email {
                        vc.tableView(vc.balanceTableView, numberOfRowsInSection: 0)
                        vc.c = user.transfers.count
                        print(user.transfers.count)
                    }
                }
            }
        }
    }
    
    func saveTransfers(tableView: UITableView, cell: BalanceCell?, vc: StatementScreen) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                
                    if CurrentUser.currentUserEmail == user.email {
                        
//                        for transfer in user.transfers {
                        
                            DispatchQueue.main.async {
                                
//                                tableView.insertRows(at: <#T##[IndexPath]#>, with: <#T##UITableView.RowAnimation#>)
//
//                                cell?.typeTransferLabel.text = transfer.transferType
//                                cell?.typeTransfer2Label.text = transfer.transferType
//                                cell?.amountLabel.text = String(transfer.amount)
                                
//                                if transfer.amount > 0 {
//
//                                    cell?.typeTransfer2Label.textColor = .green
//                                    cell?.realSignLabel.textColor = .green
//                                    cell?.amountLabel.textColor = .green
//                                    cell?.transferIconImageView.tintColor = .green
//                                }
//                                else {
//
//                                    cell?.typeTransfer2Label.textColor = .red
//                                    cell?.realSignLabel.textColor = .red
//                                    cell?.amountLabel.textColor = .red
//                                    cell?.transferIconImageView.tintColor = .red
//                                }
                            }
//                        }
                    }
                }
            }
        }
    }
}
