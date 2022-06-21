//
//  AccountScreen.swift
//  FourBank
//
//  Created by user220210 on 6/13/22.
//

import UIKit

class AccountScreen: UIViewController {
    
    let network = Network()
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var agencyLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var personalDataTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.personalDataTableView.delegate = self
        self.personalDataTableView.dataSource = self
        self.personalDataTableView.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "DataCell")
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {

    }
    
    
}

extension AccountScreen: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataCell: DataCell? = personalDataTableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as? DataCell
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        DispatchQueue.main.async {
                            self.agencyLabel.text = user.agency
                            self.accountLabel.text = user.account
                            self.usernameLabel.text = user.name
                            dataCell?.fullnameLabel.text = user.name
                            dataCell?.cpfLabel.text = user.cpf
                            dataCell?.identityLabel.text = user.rg
                            dataCell?.addressLabel.text = "Rua \(user.street)"
                            dataCell?.cityLabel.text = user.city
                            dataCell?.stateLabel.text = user.state
                            dataCell?.neighborhoodLabel.text = user.neighborhood
                            dataCell?.emailLabel.text = user.email
                            dataCell?.cellphoneLabel.text = user.cellphoneNumber
                        }
                    }
                }
            }
        }
        
        return dataCell ?? UITableViewCell ()
    }
}
