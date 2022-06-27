import UIKit



class RegisterScreen1ViewController: UIViewController {
    
    let registerScreen1VM = RegisterScreen1ViewModel()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var rgTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    @IBAction func proceedButton(_ sender: UIButton) {
        
        registerScreen1VM.validatFilledData(name: nameTextField.text ?? "", birthday: birthdayTextField.text ?? "", cpf: cpfTextField.text ?? "", rg: rgTextField.text ?? "", vc: self)
    }
    
    
    @IBAction func cancelButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "RegScreen1ToLogin", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "RegScreen1ToRegScreen2" {
            
            let vc = segue.destination as? RegisterScreen2
            vc?.name = nameTextField.text
            vc?.birthDay = birthdayTextField.text
            vc?.rg = rgTextField.text
            vc?.cpf = cpfTextField.text
        }
    }
}
