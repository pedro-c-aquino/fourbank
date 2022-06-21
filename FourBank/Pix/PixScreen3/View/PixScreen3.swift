//
//  TransferScreen3.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class PixScreen3: UIViewController {
    
    let pixScreen3VM = PixScreen3ViewModel()
    let network = Network()
    
    var pixKey: String = ""
    var transferAmount: Double = 0.00
    var cpfPix: String = ""
    var emailPix: String = ""
    var cellphonePix: String = ""
    
    @IBOutlet weak var transferDataTableView: UITableView!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.transferDataTableView.delegate = self
        self.transferDataTableView.dataSource = self
        self.transferDataTableView.register(UINib(nibName: "TransferDataCell", bundle: nil), forCellReuseIdentifier: "TransferDataCell")
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        pixScreen3VM.pixTransfer(amount: transferAmount, pixKey: pixKey)
        
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
        
        let cell: TransferDataCell? = transferDataTableView.dequeueReusableCell(withIdentifier: "TransferDataCell", for: indexPath) as? TransferDataCell
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for receivingUser in userArray {
                    
                    if self.emailPix == receivingUser.email || self.cpfPix == receivingUser.cpf || self.cellphonePix == receivingUser.cellphoneNumber {
                        
                        DispatchQueue.main.async {
                            cell?.nameLabel.text = receivingUser.name
                            cell?.cpfLabel.text = receivingUser.self.emailPix
                            cell?.accountLabel.text = receivingUser.account
                            cell?.bankOfficeLabel.text = receivingUser.agency
                            cell?.paymentValueLabel.text = String(self.transferAmount)
                            
                        }
                    }
                }
            }
        }

        
        return cell ?? UITableViewCell()
    }
    
}
