//
//  Payment1.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class Payment1: UIViewController {
    
    
    @IBOutlet weak var balanceLabel:         UILabel!
    
    @IBOutlet weak var amountTextField:  UITextField!
    
    @IBOutlet weak var barcodeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Confirmação", message: "Pagamento efetuado com sucesso!", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
            self.performSegue(withIdentifier: "PaymentScreenToHome", sender: self)
        }
        
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
