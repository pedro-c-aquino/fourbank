//
//  TransferScreen1.swift
//  FourBank
//
//  Created by user220237 on 6/1/22.
//

import UIKit

class PixScreen1: UIViewController {
    
    var transferAmount: Double = 0
    let transferScreen1VM = PixScreen1ViewModel()
    let pixKeyTypesArray = ["Email", "Telefone", "CPF", "CNPJ"]
    var selectedKeyType = "Email"
    
    let network = Network()
    let pixScreen1VM = PixScreen1ViewModel()
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var typeTransferPickerView: UIPickerView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        typeTransferPickerView.dataSource = self
        typeTransferPickerView.delegate = self
        typeTransferPickerView.setValue(UIColor(red: 1, green: 1, blue: 1, alpha: 1), forKey: "textColor")
        
        pixScreen1VM.showBalance(vc: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        amountTextField.becomeFirstResponder()
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
        
        pixScreen1VM.validateAmount(amount: amountTextField.text ?? "", vc: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? PixScreen2
        vc?.transferAmount = transferAmount
        vc?.selectedKeyType = selectedKeyType
    }
    
}

extension PixScreen1: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pixKeyTypesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pixKeyTypesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedKeyType = pixKeyTypesArray[row]
    }
    
}
