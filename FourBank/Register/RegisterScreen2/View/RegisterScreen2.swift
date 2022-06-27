import UIKit

class RegisterScreen2: UIViewController {
    
    let registerScreen2VM = RegisterScreen2ViewModel()
    
    var name: String? = nil
    var birthDay: String? = nil
    var cpf: String? = nil
    var rg: String? = nil
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var occupationTextField: UITextField!
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var cellphoneTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        registerScreen2VM.validatFilledData(email: emailTextField.text ?? "", occupation: occupationTextField.text ?? "", income: incomeTextField.text ?? "", cellphone: cellphoneTextField.text ?? "", vc: self)
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "RegScreen2ToRegScreen1", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "RegScreen2ToRegScreen3" {
            
            let vc = segue.destination as? RegisterScreen3
            vc?.name = name
            vc?.birthDay = birthDay
            vc?.rg = rg
            vc?.cpf = cpf
            vc?.email = emailTextField.text
            vc?.occupation = occupationTextField.text
            vc?.income = incomeTextField.text
            vc?.cellphone = cellphoneTextField.text
        }
    }
}
