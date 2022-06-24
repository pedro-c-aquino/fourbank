import UIKit

class DataCell: UITableViewCell {
    
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var identityLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var neighborhoodLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cellphoneLabel: UILabel!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
}
