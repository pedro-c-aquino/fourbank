import UIKit

class Deposit: UIViewController {
    
    var depVM = DepositViewModel()
    var depositAmount: Double = 0.0
    var bankAccount: String = ""
    var bankOffice: String = ""
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        depVM.formatBalance(balance: balanceLabel.text ?? "", vc: self)
    }
    
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        depVM.makeDeposit(amount: amountTextField.text ?? "", vc: self)
    }
}
