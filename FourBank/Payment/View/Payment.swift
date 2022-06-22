//
//  Payment1.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class Payment: UIViewController {
    
    var payVM = PaymentViewModel()
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var barcodeTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payVM.formatBalance(balance: balanceLabel.text ?? "", vc: self)
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        payVM.makePayment(amount: amountTextField.text ?? "", codBar: barcodeTextField.text ?? "", vc: self)
    }
}
