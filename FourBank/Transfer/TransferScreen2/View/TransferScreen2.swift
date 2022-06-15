//
//  TransferScreen2.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class TransferScreen2: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bankOfficeTextField: UITextField!
    @IBOutlet weak var bankAccountTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "TrScreen2ToTrScreen3", sender: self)
        
    }
    
}
