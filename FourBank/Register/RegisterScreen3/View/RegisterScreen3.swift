//
//  RegisterScreen2.swift
//  FourBank
//
//  Created by kauekaj on 6/1/22.
//

import UIKit

class RegisterScreen3: UIViewController {
    
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var neighborhoodTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {

        performSegue(withIdentifier: "RegScreen3ToRegScreen4", sender: self)
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "RegScreen3ToRegScreen2", sender: self)
    }

}
