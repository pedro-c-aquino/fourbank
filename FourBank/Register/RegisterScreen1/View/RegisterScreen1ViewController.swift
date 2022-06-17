//
//  RegisterScreen1ViewController.swift
//  FourBank
//
//  Created by user208023 on 6/1/22.
//

import UIKit

class RegisterScreen1ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var rgTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    @IBAction func proceedButton(_ sender: UIButton) {

        self.performSegue(withIdentifier: "RegScreen1ToRegScreen2", sender: self)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "RegScreen1ToLogin", sender: self)
    }

}
