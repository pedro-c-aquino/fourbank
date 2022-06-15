//
//  transferDataCell.swift
//  FourBank
//
//  Created by user220237 on 6/13/22.
//

import UIKit

class transferDataCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var bankOfficeLabel: UILabel!
    @IBOutlet weak var paymentValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
