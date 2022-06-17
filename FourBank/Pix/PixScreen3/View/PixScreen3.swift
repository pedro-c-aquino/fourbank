//
//  TransferScreen3.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class PixScreen3: UIViewController {
    
    
    @IBOutlet weak var transferDataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.transferDataTableView.delegate = self
        self.transferDataTableView.dataSource = self
        
        self.transferDataTableView.register(UINib(nibName: "transferDataCell", bundle: nil), forCellReuseIdentifier: "transferDataCell")
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Confirmação", message: "PIX efetuado com sucesso!", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
            self.performSegue(withIdentifier: "PixScreenToHome", sender: self)
        }
        
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    

}

extension PixScreen3: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: transferDataCell? = transferDataTableView.dequeueReusableCell(withIdentifier: "transferDataCell", for: indexPath) as? transferDataCell
               
        return cell ?? UITableViewCell()
        
    }
    
    
    
}
