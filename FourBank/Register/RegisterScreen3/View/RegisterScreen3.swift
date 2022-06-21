//
//  RegisterScreen2.swift
//  FourBank
//
//  Created by kauekaj on 6/1/22.
//

import UIKit

class RegisterScreen3: UIViewController {
    
    var name: String? = nil
    var birthDay: String? = nil
    var cpf: String? = nil
    var rg: String? = nil
    var email: String? = nil
    var occupation: String? = nil
    var income: String? = nil
    var cellphone: String? = nil
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "RegScreen3ToRegScreen4" {
            
            let vc = segue.destination as? RegisterScreen4
            vc?.name = name
            vc?.birthDay = birthDay
            vc?.rg = rg
            vc?.cpf = cpf
            vc?.email = email
            vc?.occupation = occupation
            vc?.income = income
            vc?.cellphone = cellphone
            vc?.street = streetTextField.text
            vc?.number = numberTextField.text
            vc?.neighborhood = neighborhoodTextField.text
            vc?.city = cityTextField.text
            vc?.state = stateTextField.text
            
        }
    }

}
