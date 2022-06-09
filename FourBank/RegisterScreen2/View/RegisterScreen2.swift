//
//  RegisterScreen2.swift
//  FourBank
//
//  Created by kauekaj on 6/1/22.
//

import UIKit

class RegisterScreen2: UIViewController {

    let registerScreen2ViewModel = RegisterScreen2ViewModel()
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
        registerScreen2ViewModel.registerPersonalInfo(address: addressTextField.text, city: cityTextField.text, state: stateTextField.text, zipcode: zipcodeTextField.text)
        performSegue(withIdentifier: "RegScreen2ToRegScreen3", sender: self)
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        performSegue(withIdentifier: "RegScreen2ToRegScreen1", sender: self)
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
