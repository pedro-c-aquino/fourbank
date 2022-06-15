//
//  Deposit1.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class Deposit1: UITableViewController {
    
    
    @IBOutlet weak var balanceLabel:     UILabel!
    
    @IBOutlet weak var amountLabel:  UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "DepositScreen1ToDepositScreen2", sender: nil)
    }
    

}
