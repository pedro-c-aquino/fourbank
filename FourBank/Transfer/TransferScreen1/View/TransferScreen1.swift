//
//  TransferScreen1.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class TransferScreen1: UIViewController {
    
    var transferAmount: Double = 0.0
    let trScreen1VM = TransferScreen1ViewModel()
    let network = Network()

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        DispatchQueue.main.async {
                            
                            self.balanceLabel.text = String(format: "%.2f", Double(user.accountBalance)).replacingOccurrences(of: ".", with: ",")
                        }
                    }
                }
            }
        }
    }

    @IBAction func proceedButton(_ sender: UIButton) {
        
        transferAmount = trScreen1VM.getAmount(amountText: amountTextField.text)
        performSegue(withIdentifier: "TrScreen1ToTrScreen2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? TransferScreen2
        vc?.transferAmount = transferAmount
    }
    
}
