//
//  TransferScreen1.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class TransferScreen1: UIViewController {

    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        amountTextField.becomeFirstResponder()
    }

    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
        performSegue(withIdentifier: "TrScreen1ToTrScreen2", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
