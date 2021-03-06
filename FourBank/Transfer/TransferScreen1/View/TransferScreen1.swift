import UIKit

class TransferScreen1: UIViewController {
    
    var transferAmount: Double = 0.0
    let trScreen1VM = TransferScreen1ViewModel()
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        trScreen1VM.changeBalance(vc: self)
    }
    
    
    @IBAction func proceedButton(_ sender: UIButton) {
        
        transferAmount = trScreen1VM.getAmount(amountText: amountTextField.text)
        performSegue(withIdentifier: "TrScreen1ToTrScreen2", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? TransferScreen2
        vc?.transferAmount = transferAmount
    }
}
