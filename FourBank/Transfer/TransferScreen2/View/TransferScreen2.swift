//
//  TransferScreen2.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class TransferScreen2: UIViewController {
    
    var transferAmount: Double = 0.0
    var name: String = ""
    var bankOffice: String = ""
    var bankAccount: String = ""
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bankOfficeTextField: UITextField!
    @IBOutlet weak var bankAccountTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
        
        name = nameTextField.text ?? ""
        bankOffice = bankOfficeTextField.text ?? ""
        bankAccount = bankAccountTextField.text ?? ""
        performSegue(withIdentifier: "TrScreen2ToTrScreen3", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? TransferScreen3
        vc?.name = name
        vc?.bankOffice = bankOffice
        vc?.bankAccount = bankAccount
        vc?.transferAmount = transferAmount
    }
    
}
