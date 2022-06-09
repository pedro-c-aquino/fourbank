//
//  RegisterScreen1ViewController.swift
//  FourBank
//
//  Created by user208023 on 6/1/22.
//

import UIKit

class RegisterScreen1ViewController: UIViewController {
    
    let registerScreen1ViewModel = RegisterScreen1ViewModel()

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var rgTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            }

    @IBAction func proceedButton(_ sender: UIButton) {
        registerScreen1ViewModel.registerPersonalInfo(firstName: firstNameTextField.text, lastName: lastNameTextField.text, cpf: cpfTextField.text, rg: rgTextField.text)
        self.performSegue(withIdentifier: "RegScreen1ToRegScreen2", sender: self)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true)
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