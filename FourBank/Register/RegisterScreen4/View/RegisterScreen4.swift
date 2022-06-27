import UIKit

class RegisterScreen4: UIViewController{
    
    let registerScreen4VM = RegisterScreen4ViewModel()
    let network = Network()
    var name: String? = nil
    var birthDay: String? = nil
    var cpf: String? = nil
    var rg: String? = nil
    var email: String? = nil
    var occupation: String? = nil
    var income: String? = nil
    var cellphone: String? = nil
    var street: String? = nil
    var number: String? = nil
    var neighborhood: String? = nil
    var city: String? = nil
    var state: String? = nil
    var password: String? = nil
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        if let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text {
            
            if registerScreen4VM.checkPassword(password: password, confirmPassword: confirmPassword, vc: self) {
                
                network.registerUser(name: name ?? "", birthDate: birthDay ?? "", cpf: cpf ?? "", rg: rg ?? "", email: email ?? "", occupation: occupation ?? "", income: income ?? "", cellphoneNumber: cellphone ?? "", street: street ?? "", number: number ?? "", neighborhood: neighborhood ?? "", city: city ?? "", state: state ?? "", password: password, vc: self)
            }
        }
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "RegScreen4ToRegScreen3", sender: self)
    }
}
