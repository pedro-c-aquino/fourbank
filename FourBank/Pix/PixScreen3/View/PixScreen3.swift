import UIKit

class PixScreen3: UIViewController {
    
    let pixScreen3VM = PixScreen3ViewModel()
    var selectedKeyType = ""
    var pixKey: String = ""
    var transferAmount: Double = 0.00
    var cpfPix: String = ""
    
    @IBOutlet weak var transferDataTableView: UITableView!
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.transferDataTableView.delegate = self
        self.transferDataTableView.dataSource = self
        self.transferDataTableView.register(UINib(nibName: "TransferDataCell", bundle: nil), forCellReuseIdentifier: "TransferDataCell")
    }
    
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        pixScreen3VM.pixTransfer(amount: transferAmount, pixKey: pixKey, vc: self)
        pixScreen3VM.addPixContact(pixKey: pixKey, pixType: selectedKeyType, vc: self)
    }
}

extension PixScreen3: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TransferDataCell? = transferDataTableView.dequeueReusableCell(withIdentifier: "TransferDataCell", for: indexPath) as? TransferDataCell
        pixScreen3VM.setTransferData(pixKey: pixKey, cell: cell, vc: self)
        return cell ?? UITableViewCell()
    }
}
