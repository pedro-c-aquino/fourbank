//
//  TransferScreen2.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class PixScreen2: UIViewController {
    
    var contatos: [String] = ["Pedro", "Henrique", "Kaue"]
    var selectedKeyType = ""
    var transferAmount: Double = 0.00
    var pixKey: String = "Valor Inicial"
    
    let network = Network()
    let pixScreen2VM = PixScreen2ViewModel()
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var pixKeyTextField: UITextField!
    @IBOutlet weak var contactsTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        pixScreen2VM.showBalance(vc: self)
        pixScreen2VM.keyType(keyType: selectedKeyType, vc: self)
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
        
        pixScreen2VM.validateAmount(pixKey: pixKeyTextField.text ?? "", vc: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? PixScreen3
        vc?.transferAmount = transferAmount
        vc?.pixKey = pixKey
    }
    
}

extension PixScreen2: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        contatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        cell.textLabel?.text = contatos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "PixScreen2ToPixScreen3", sender: self)
    }
    
}
