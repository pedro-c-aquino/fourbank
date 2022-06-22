//
//  Deposit1.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class Deposit: UIViewController {
    
    let network = Network()
    var depVM = DepositViewModel()
    var depositAmount: Double = 0.0
    var bankAccount: String = ""
    var bankOffice: String = ""
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        depVM.formatBalance(balance: balanceLabel.text ?? "", vc: self)
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        depVM.makeDeposit(amount: amountTextField.text ?? "", vc: self)
    }
}
