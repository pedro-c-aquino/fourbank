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
    var pixKey: String = ""
    var cpfPix: String = ""
    var emailPix: String = ""
    var cellphonePix: String = ""


    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var pixKeyTextField: UITextField!
    @IBOutlet weak var contactsTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(transferAmount)
        print(selectedKeyType)
        switch selectedKeyType {
        case "CPF":
            pixKeyTextField.placeholder = "Digite a chave Pix CPF"
            cpfPix = pixKeyTextField.text ?? ""
        case "Email":
            pixKeyTextField.placeholder = "Digite a chave Pix Email"
            emailPix = pixKeyTextField.text ?? ""
        case "Telefone":
            pixKeyTextField.placeholder = "Digite a chave Pix Telefone"
            cellphonePix = pixKeyTextField.text ?? ""
        default:
            print("Erro no keyType")
        }
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
        pixKey = pixKeyTextField.text ?? ""
        performSegue(withIdentifier: "PixScreen2ToPixScreen3", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? PixScreen3
        vc?.transferAmount = transferAmount
        vc?.pixKey = pixKey
        vc?.cpfPix = cpfPix
        vc?.emailPix = emailPix
        vc?.cellphonePix = cellphonePix
        
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
        
        performSegue(withIdentifier: "TrScreen2ToTrScreen3", sender: self)
    }
    
}
