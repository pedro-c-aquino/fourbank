//
//  TransferScreen1.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class TransferScreen1: UIViewController {

    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    @IBAction func proceedButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "TrScreen1ToTrScreen2", sender: self)
    }
}
