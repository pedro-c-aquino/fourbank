//
//  RegisterScreen4.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class RegisterScreen4: UIViewController{

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    @IBAction func registerButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "RegScreen4ToMain", sender: self)
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "RegScreen4ToRegScreen3", sender: self)
    }
    
}
