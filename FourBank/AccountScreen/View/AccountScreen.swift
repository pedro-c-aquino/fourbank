//
//  AccountScreen.swift
//  FourBank
//
//  Created by user220210 on 6/13/22.
//

import UIKit

class AccountScreen: UIViewController {
    
    let accountScreenVM = AccountScreenViewModel()
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var agencyLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var personalDataTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.personalDataTableView.delegate   = self
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
        accountScreenVM.networkUser { userArray, error in
            DispatchQueue.main.async {
                self.agencyLabel.text = userArray?[0].agency
                self.accountLabel.text = userArray?[0].account
                self.usernameLabel.text = userArray?[0].name
                dataCell?.cpfLabel.text = userArray?[0].cpf
                dataCell?.cityLabel.text = userArray?[0].city

            }
        }
        return dataCell ?? UITableViewCell ()
    }
}
