//
//  StatementScreen.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class StatementScreen: UIViewController {
    
    let statementeVM = StatementScreenViewModel()
    var c: Int = 0
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var balanceTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.balanceTableView.delegate = self
        self.balanceTableView.dataSource = self
        self.balanceTableView.register(UINib(nibName: "BalanceCell", bundle: nil), forCellReuseIdentifier: "BalanceCell")
        
        statementeVM.formatBalance(balance: balanceLabel.text ?? "", vc: self)
        
        statementeVM.countTransfer(tableView: balanceTableView, vc: self)
        print(c)
    }
    
}

extension StatementScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return c
//        let balanceCell: BalanceCell? = balanceTableView.dequeueReusableCell(withIdentifier: "BalanceCell") as? BalanceCell
//
//        statementeVM.countTransfer(cell: balanceCell, vc: self)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let balanceCell: BalanceCell? = balanceTableView.dequeueReusableCell(withIdentifier: "BalanceCell", for: indexPath) as? BalanceCell
        
        statementeVM.saveTransfers(tableView: balanceTableView, cell: balanceCell, vc: self)
        
        return balanceCell ?? UITableViewCell ()
        
    }
    
}
