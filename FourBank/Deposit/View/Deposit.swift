//
//  Deposit1.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class Deposit: UIViewController {
    
    var network = Network()
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var amountLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        DispatchQueue.main.async {
                            
                            self.balanceLabel.text = "R$ \(String(format: "%.2f", Double(user.accountBalance)))".replacingOccurrences(of: ".", with: ",")
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Confirmação", message: "Depósito efetuado com sucesso!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
            self.performSegue(withIdentifier: "DepositScreenToHome", sender: self)
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
}
