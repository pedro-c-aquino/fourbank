//
//  BalanceCell.swift
//  FourBank
//
//  Created by Henrique Rodrigues Silva on 6/10/22.
//

import UIKit

class BalanceCell: UITableViewCell {

    @IBOutlet weak var userLabel:             UILabel!
    
    @IBOutlet weak var transferredValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}