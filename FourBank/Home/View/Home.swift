//
//  Home.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class Home: UIViewController {

    
    @IBOutlet weak var hideBalanceButton: UIBarButtonItem!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var hiddenBalanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        balanceLabel.isHidden = true
        hiddenBalanceLabel.isHidden = false
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
