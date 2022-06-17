//
//  RegisterScreen3.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit
import Firebase

class RegisterScreen3: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var occupationTextField: UITextField!
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var cellphoneTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "RegScreen2ToRegScreen3", sender: self)
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "RegScreen2ToRegScreen1", sender: self)
    }
    
}
