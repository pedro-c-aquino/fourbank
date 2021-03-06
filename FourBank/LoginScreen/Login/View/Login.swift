import UIKit

class Login: UIViewController {
    
    let loginViewModel = LoginViewModel()
    
    @IBOutlet weak var emailTextField:    UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        loginViewModel.validateLoginData(email: emailTextField.text, password: passwordTextField.text, vc: self)
    }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toRegister", sender: nil)
    }
}
