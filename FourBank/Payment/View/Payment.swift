//
//  Payment1.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class Payment: UIViewController {
    
    let network = Network()
    var payVM = PaymentViewModel()
    var paymentAmount: Double = 0.0
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var barcodeTextField: UITextField!
        
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
        
        payVM.makePayment(amount: amountTextField.text ?? "")
        
        let alert = UIAlertController(title: "Confirmação", message: "Pagamento efetuado com sucesso!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
            self.performSegue(withIdentifier: "PaymentScreenToHome", sender: self)
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
}
