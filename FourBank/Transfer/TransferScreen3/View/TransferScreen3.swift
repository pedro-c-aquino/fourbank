//
//  TransferScreen3.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class TransferScreen3: UIViewController {

    @IBOutlet weak var transferInfoTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        transferInfoTableView.delegate = self
        transferInfoTableView.dataSource = self
        transferInfoTableView.register(UINib(nibName: "transferDataCell", bundle: nil), forCellReuseIdentifier: "transferDataCell")
    }

    @IBAction func confirmButton(_ sender: UIButton) {
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
    }
}

extension TransferScreen3: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: transferDataCell? = transferInfoTableView.dequeueReusableCell(withIdentifier: "transferDataCell", for: indexPath) as? transferDataCell
        cell?.cpfLabel.isHidden = true
        cell?.cpfTitleLabel.isHidden = true
        
        return cell ?? UITableViewCell()
    }
    
    
}
