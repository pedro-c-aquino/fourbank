//
//  Deposit1.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class Deposit1: UIViewController {
    
    
    @IBOutlet weak var balanceLabel:     UILabel!
    
    @IBOutlet weak var amountLabel:  UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
