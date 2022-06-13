//
//  TransferScreen3.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class TransferScreen3: UIViewController {
    
    
    @IBOutlet weak var transferDataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.transferDataTableView.delegate = self
        self.transferDataTableView.dataSource = self
        
        self.transferDataTableView.register(UINib(nibName: "transferDataCell", bundle: nil), forCellReuseIdentifier: "transferDataCell")
    }

}

extension TransferScreen3: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let transferDataCell: transferDataCell? = transferDataTableView.dequeueReusableCell(withIdentifier: "transferDataCell", for: indexPath) as? transferDataCell
               
        return transferDataCell ?? UITableViewCell()
    }
    
    
    
}
