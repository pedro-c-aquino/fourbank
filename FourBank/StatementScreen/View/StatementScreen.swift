//
//  StatementScreen.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class StatementScreen: UIViewController {
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var balanceTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.balanceTableView.delegate = self
        self.balanceTableView.dataSource = self
        
        self.balanceTableView.register(UINib(nibName: "BalanceCell", bundle: nil), forCellReuseIdentifier: "BalanceCell")

    }


}

extension StatementScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let balanceCell: BalanceCell? = balanceTableView.dequeueReusableCell(withIdentifier: "BalanceCell", for: indexPath) as? BalanceCell
        
        
        return balanceCell ?? UITableViewCell ()
    }
    
}
