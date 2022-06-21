//
//  RegisterScreen4.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class RegisterScreen4: UIViewController{
    
    let network = Network()
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    @IBAction func registerButton(_ sender: UIButton) {
        //network.registerUser(name: <#T##String#>, birthDate: <#T##String#>, cpf: <#T##String#>, rg: <#T##String#>, email: <#T##String#>, occupation: <#T##String#>, income: <#T##String#>, cellphoneNumber: <#T##String#>, street: <#T##String#>, number: <#T##String#>, neighborhood: <#T##String#>, city: <#T##String#>, state: <#T##String#>, password: <#T##String#>)
        
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
