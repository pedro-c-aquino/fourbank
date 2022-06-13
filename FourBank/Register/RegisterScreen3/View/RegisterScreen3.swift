//
//  RegisterScreen3.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class RegisterScreen3: UIViewController {
    
    let registerScreen3VM = RegisterScreen3ViewModel()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func registerButton(_ sender: UIButton) {
        
        let email = emailTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        if password == confirmPassword {
            registerScreen3VM.registerUser(email: email, password: password)
        }
        
        self.performSegue(withIdentifier: "RegScreen3ToMain", sender: self)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RegScreen3ToRegScreen2", sender: self)
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
