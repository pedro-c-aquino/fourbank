//
//  ResetPassword.swift
//  FourBank
//
//  Created by user220237 on 6/17/22.
//

import UIKit

class ResetPAssword: UIViewController {
    
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func resetPasswordButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Confirmação", message: "Senha alterada com sucesso!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
            
            self.performSegue(withIdentifier: "resetPasswordToLogin", sender: self)
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
}
