//
//  DataCell.swift
//  FourBank
//
//  Created by user220210 on 6/13/22.
//

import UIKit

class DataCell: UITableViewCell {
    
    @IBOutlet weak var fullnameLabel: UILabel!
    
    @IBOutlet weak var cpfLabel:      UILabel!
    
    @IBOutlet weak var identityLabel: UILabel!
    
    @IBOutlet weak var addressLabel:  UILabel!
    
    @IBOutlet weak var cityLabel:     UILabel!
    
    @IBOutlet weak var stateLabel:    UILabel!
    
    @IBOutlet weak var cepLabel:      UILabel!
    
    @IBOutlet weak var emailLabel:    UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
}
