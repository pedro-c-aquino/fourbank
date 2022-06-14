//
//  AccountScreen.swift
//  FourBank
//
//  Created by user220210 on 6/13/22.
//

import UIKit
import Firebase

class AccountScreen: UIViewController {
    
    @IBOutlet weak var usernameLabel:             UILabel!
    
    @IBOutlet weak var agencyLabel:               UILabel!
    
    @IBOutlet weak var accountLabel:              UILabel!
    
    @IBOutlet weak var personalDataTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.personalDataTableView.delegate   = self
        self.personalDataTableView.dataSource = self
        self.personalDataTableView.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "DataCell")

    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "Main", sender: nil)
            
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    
}

extension AccountScreen: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataCell: DataCell? = personalDataTableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as? DataCell
        return dataCell ?? UITableViewCell ()
    }
    
    
}
