import UIKit

class TransferScreen3: UIViewController {
    
    let trScreen3VM = TransferScreen3ViewModel()
    var name: String = ""
    var transferAmount: Double = 0.0
    var bankAccount: String = ""
    var bankOffice: String = ""
    
    @IBOutlet weak var transferInfoTableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        transferInfoTableView.delegate = self
        transferInfoTableView.dataSource = self
        transferInfoTableView.register(UINib(nibName: "TransferDataCell", bundle: nil), forCellReuseIdentifier: "TransferDataCell")
    }
    
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        trScreen3VM.makeTransfer(amount: transferAmount, agency: bankOffice, account: bankAccount, vc: self)
    }
}

extension TransferScreen3: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TransferDataCell? = transferInfoTableView.dequeueReusableCell(withIdentifier: "TransferDataCell", for: indexPath) as? TransferDataCell
        trScreen3VM.showTransferData(cell: cell, amount: transferAmount, name: name, bankAccount: bankAccount, bankOffice: bankOffice)
        return cell ?? UITableViewCell()
    }
}
