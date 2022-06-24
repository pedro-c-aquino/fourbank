import UIKit

class Home: UIViewController {
    
    var homeVM = HomeViewModel()
    
    @IBOutlet weak var hideBalanceButton: UIBarButtonItem!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var hiddenBalanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        balanceLabel.isHidden = true
        hiddenBalanceLabel.isHidden = false
        homeVM.showBalance(vc: self)
    }
    
    
    @IBAction func hideBalanceButtonTapped(_ sender: UIBarButtonItem) {
        
        homeVM.hideButtonTapped(vc: self)
    }
}
