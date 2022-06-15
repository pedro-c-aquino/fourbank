//
//  TransferScreen2.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class PixScreen2: UIViewController {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var pixKeyTextField: UITextField!
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contatos: [String] = [
        "Pedro",
        "Henrique",
        "Kaue"
    ]
    
    var transferAmount: Double = 0.00

    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(transferAmount)
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "PixScreen2ToPixScreen3", sender: self)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
