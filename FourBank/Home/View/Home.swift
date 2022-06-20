//
//  Home.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class Home: UIViewController {

    var network = Network()
    var homeVM = HomeViewModel()
    
    @IBOutlet weak var hideBalanceButton: UIBarButtonItem!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var hiddenBalanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        balanceLabel.isHidden = true
        hiddenBalanceLabel.isHidden = false
        
        network.networkUser { userArray, error in
            if let user = userArray?[0] {
                DispatchQueue.main.async {
                    self.nameLabel.text = "Olá, \(user.name)"
                    //self.balanceLabel.text = self.homeVM.getAmount(amountText: "R$ \(Double(user.accountBalance))")
                    self.balanceLabel.text = "R$ \(Double(user.accountBalance))".replacingOccurrences(of: ".", with: ",")
                }
            }
        }
    }
    
    
    @IBAction func hideBalanceButtonTapped(_ sender: UIBarButtonItem) {
        
        hideButtonTapped()
    }
    
    func hideButtonTapped() {
        
        if balanceLabel.isHidden {
            
            balanceLabel.isHidden = false
            hiddenBalanceLabel.isHidden = true
            hideBalanceButton.image = UIImage(systemName: "eye.slash.fill")
        } else {
            
            balanceLabel.isHidden = true
            hiddenBalanceLabel.isHidden = false
            hideBalanceButton.image = UIImage(systemName: "eye.fill")
        }
    }

}
