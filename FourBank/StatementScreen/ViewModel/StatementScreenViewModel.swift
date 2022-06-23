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
    
    func countTransfer(cell: BalanceCell?, vc: StatementScreen) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                
                    if CurrentUser.currentUserEmail == user.email {
                        
                       user.transfers.count
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
                            }
                        }
                    }
                }
            }
        }
    }
}
