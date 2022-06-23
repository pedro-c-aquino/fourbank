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
    
    func countTransfer(vc: StatementScreen) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                
                    if CurrentUser.currentUserEmail == user.email {
                        vc.tableView(vc.balanceTableView, numberOfRowsInSection: user.transfers.count)
                        vc.c = user.transfers.count
                        print(user.transfers.count)
                    }
                }
            }
        }
    }
    
    func saveTransfers(cell: BalanceCell?, vc: StatementScreen) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                
                    if CurrentUser.currentUserEmail == user.email {
                        
                        for transfer in user.transfers {
                        
                            DispatchQueue.main.async {
                                
                                cell?.typeTransferLabel.text = transfer.transferType
                                cell?.typeTransfer2Label.text = transfer.transferType
                                cell?.amountLabel.text = String(transfer.amount)
                                
                                if transfer.amount > 0 {
                                    
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
    }
}
