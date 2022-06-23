//
//  TransferScreen3ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation
import UIKit


class PixScreen3ViewModel: UIViewController {
    
    let network = Network()
    
    func getAmount(amountValue: Double?) -> String {
        
        let amountDouble = amountValue ?? 0.00
        let amountString = String(format: "%.2f", Double(amountDouble))
        let convertedString = amountString.replacingOccurrences(of: ",", with: ".")
        let amount = "R$ \(convertedString)"
        return amount
        
    }
    
    func pixTransfer(amount: Double, pixKey: String, vc: UIViewController) {
        
        self.network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                var transferOk = false
                var loggedUser: UserModel? = nil
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        if amount <= Double(user.accountBalance) {
                            
                            loggedUser = user
                            transferOk = true
                            
                           
                        } else {
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: "Saldo Insuficiente", message: "Não existe saldo suficiente para realizar a transferência.", preferredStyle: .alert)
                                let ok = UIAlertAction(title: "Ok", style: .default)
                                alert.addAction(ok)
                                vc.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }
                
                if transferOk {
                    
                    for receivingUser in userArray {
                        
                        if pixKey == receivingUser.email || pixKey == receivingUser.cpf || pixKey == receivingUser.cellphoneNumber{
                            
                            if let loggedUser = loggedUser {
                                
                                var loggedUserTransfers = loggedUser.transfers
                                let currentLoggedUserTransfer = Transfer(amount: -amount, transferType: "Pix enviado")
                                loggedUserTransfers.append(currentLoggedUserTransfer)
                                self.network.addTransfer(id: loggedUser.id, transferData: TransferPutModel(accountBalance: loggedUser.accountBalance - Int(amount), transfers: loggedUserTransfers))
                                var receivingUserTransfers = receivingUser.transfers
                                let currentReceivingUserTransfer = Transfer(amount: amount, transferType: "Pix recebido")
                                receivingUserTransfers.append(currentReceivingUserTransfer)
                                self.network.addTransfer(id: receivingUser.id, transferData: TransferPutModel(accountBalance: receivingUser.accountBalance + Int(amount), transfers: receivingUserTransfers))
                            
                            DispatchQueue.main.async {
                            
                                let alert = UIAlertController(title: "Confirmação", message: "Transferência via Pix concluída com sucesso.", preferredStyle: .alert)
                                let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
                                                vc.performSegue(withIdentifier: "PixScreenToHome", sender: self)
                                            }
                                alert.addAction(ok)
                                vc.present(alert, animated: true, completion: nil)
                            
                            }
                        }
                    }
                    
                }
            }
        }
        }
    }
    
    func setTransferData(pixKey: String?, cell: TransferDataCell?, vc: PixScreen3 ) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                for receivingUser in userArray {
                    
                    if pixKey == receivingUser.email || pixKey == receivingUser.cpf || pixKey == receivingUser.cellphoneNumber {
                        
                        DispatchQueue.main.async {
                            
                            cell?.nameLabel.text = receivingUser.name
                            cell?.cpfLabel.text = receivingUser.email
                            cell?.accountLabel.text = receivingUser.account
                            cell?.bankOfficeLabel.text = receivingUser.agency
                            cell?.paymentValueLabel.text = vc.pixScreen3VM.getAmount(amountValue: vc.transferAmount)
                        }
                    }
                }
            }
        }
    }
    
    func addPixContact(pixKey: String, pixType: String, vc: PixScreen3) {
        
        network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                var userOk = false
                
                var loggedUser: UserModel? = nil
                
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        userOk = true
                        loggedUser = user
                    }
                }
                if userOk {
                    
                    for receivingUser in userArray {
                        
                        
                        if pixKey == receivingUser.email || pixKey == receivingUser.cpf || pixKey == receivingUser.cellphoneNumber  {
                            
                            if let loggedUser = loggedUser {
                                
                                var pixArray = loggedUser.pixContacts
                                let newPixContact = PixContact(name: receivingUser.name, keyType: pixType, pixKey: pixKey)
                                pixArray.append(newPixContact)
                                self.network.addPixContact(id: loggedUser.id, contactData: PixContactModel(pixContacts: pixArray))
                            }
                        }
                    }
                }
            }
        }
    }
}
