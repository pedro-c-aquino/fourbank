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
        
        let alert = UIAlertController(title: "Cadastrado", message: "Cliente cadastrado com sucesso!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
            self.performSegue(withIdentifier: "RegScreen4ToMain", sender: self)
        }
        
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "RegScreen4ToRegScreen3", sender: self)
    }
    
}
