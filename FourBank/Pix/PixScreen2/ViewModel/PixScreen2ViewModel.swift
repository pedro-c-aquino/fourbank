//
//  TransferScreen2ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation
import UIKit

class PixScreen2ViewModel {
    
    let network = Network()
    
    func validatePixKey(pixKey: String, pixType: String, vc: PixScreen2) {
        
        if pixKey == "" {
            
            let alert = UIAlertController(title: "Atenção", message: "Informar a chave Pix", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            vc.present(alert, animated: true, completion: nil)
        } else {
            
            network.networkUser { userArray, error in
                
                if let userArray = userArray {
                    
                    var pixKeyOk = false
                    for user in userArray {
                        
                        if pixKey == user.emailPix || pixKey == user.cellphonePix || pixKey == user.cpfPix {
                            
                            pixKeyOk = true
                        }
                        
                    }
                    if pixKeyOk {
                        
                        DispatchQueue.main.async {
                            
                            vc.pixKey = pixKey
                            vc.performSegue(withIdentifier: "PixScreen2ToPixScreen3", sender: self)
                        }
                    } else {
                        
                        DispatchQueue.main.async {
                            
                            let alert = UIAlertController(title: "Atenção", message: "Chave Pix inválida", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "Ok", style: .default)
                            alert.addAction(ok)
                            vc.present(alert, animated: true, completion: nil)
                        }
                    }
                }
            }
        }
    }
    
    
    func showBalance(vc: PixScreen2) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        DispatchQueue.main.async {
                            
                            vc.balanceLabel.text = "R$ \(String(format: "%.2f", Double(user.accountBalance)))".replacingOccurrences(of: ".", with: ",")
                        }
                    }
                }
            }
        }
    }
    
    func keyType(keyType: String, vc: PixScreen2) {
        
        switch keyType {
        case "CPF":
            vc.pixKeyTextField.placeholder = "Digite a chave Pix CPF"
        case "Email":
            vc.pixKeyTextField.placeholder = "Digite a chave Pix Email"
        case "Telefone":
            vc.pixKeyTextField.placeholder = "Digite a chave Pix Telefone"
        default:
            print("Erro no keyType")
        }
    }
    
}
