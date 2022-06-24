import Foundation
import UIKit

class AccountScreenViewModel {
    
    let network = Network()
    
    
    func showUser(dataCell: DataCell?, vc: AccountScreen) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        DispatchQueue.main.async {
                            vc.agencyLabel.text = user.agency
                            vc.accountLabel.text = user.account
                            vc.usernameLabel.text = user.name
                            dataCell?.fullnameLabel.text = user.name
                            dataCell?.cpfLabel.text = user.cpf
                            dataCell?.identityLabel.text = user.rg
                            dataCell?.addressLabel.text = "Rua \(user.street), \(user.number)"
                            dataCell?.cityLabel.text = user.city
                            dataCell?.stateLabel.text = user.state
                            dataCell?.neighborhoodLabel.text = user.neighborhood
                            dataCell?.emailLabel.text = user.email
                            dataCell?.cellphoneLabel.text = user.cellphoneNumber
                        }
                    }
                }
            }
        }
    }
}
