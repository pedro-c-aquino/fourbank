import UIKit

class TransferScreen3ViewModel {
    
    let network = Network()
    
    
    func getAmountString(amount: Double) -> String {
        
        let amountConverted = String(format: "%.2f", amount)
        let amountString = "R$ " + amountConverted.replacingOccurrences(of: ".", with: ",")
        return amountString
    }
    
    
    func showTransferData(cell: TransferDataCell?, amount: Double, name: String, bankAccount: String, bankOffice: String) {
        
        cell?.cpfLabel.isHidden = true
        cell?.cpfTitleLabel.isHidden = true
        cell?.nameLabel.text = name
        cell?.accountLabel.text = bankAccount
        cell?.paymentValueLabel.text = getAmountString(amount: amount)
        cell?.bankOfficeLabel.text = bankOffice
    }
    
    
    func makeTransfer(amount: Double, agency: String, account: String, vc: UIViewController) {
        
        self.network.networkUser { userArray, error in
            
            if let userArray = userArray {
                
                var transferOk = false
                var accountDataMatch = false
                var loggedUser: UserModel? = nil
                for user in userArray {
                    
                    if CurrentUser.currentUserEmail == user.email {
                        
                        if amount <= Double(user.accountBalance) {
                            
                            transferOk = true
                            loggedUser = user
                        }
                    }
                }
                
                if transferOk {
                    
                    for receivingUser in userArray {
                        
                        if agency == receivingUser.agency {
                            
                            if account == receivingUser.account {
                                
                                accountDataMatch = true
                                if let loggedUser = loggedUser {
                                    
                                    var loggedUserTransfers = loggedUser.transfers
                                    let currentLoggedUserTransfer = Transfer(amount: -amount, transferType: "Transfer??ncia enviada")
                                    loggedUserTransfers.append(currentLoggedUserTransfer)
                                    self.network.addTransfer(id: loggedUser.id, transferData: TransferPutModel(accountBalance: loggedUser.accountBalance - Int(amount), transfers: loggedUserTransfers))
                                    var receivingUserTransfers = receivingUser.transfers
                                    let currentReceivingUserTransfer = Transfer(amount: amount, transferType: "Transfer??ncia recebida")
                                    receivingUserTransfers.append(currentReceivingUserTransfer)
                                    self.network.addTransfer(id: receivingUser.id, transferData: TransferPutModel(accountBalance: receivingUser.accountBalance + Int(amount), transfers: receivingUserTransfers))
                                    DispatchQueue.main.async {
                                        
                                        let alert = UIAlertController(title: "Confirma????o", message: "Transfer??ncia efetuada com sucesso!", preferredStyle: .alert)
                                        let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
                                            vc.performSegue(withIdentifier: "TrScreen3ToHome", sender: self)
                                        }
                                        alert.addAction(ok)
                                        vc.present(alert, animated: true, completion: nil)
                                    }
                                }
                            }
                        }
                    }
                } else {
                    
                    DispatchQueue.main.async {
                        
                        let alert = UIAlertController(title: "Saldo insuficiente", message: "N??o possui saldo suficiente para realizar a transfer??ncia.", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Ok", style: .default)
                        alert.addAction(ok)
                        vc.present(alert, animated: true, completion: nil)
                    }
                }
                if !accountDataMatch {
                    
                    DispatchQueue.main.async {
                        
                        let alert = UIAlertController(title: "Dados inv??lidos", message: "N??o foi poss??vel encontrar conta com os dados especificados. Verifique e tente novamente.", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Ok", style: .default)
                        alert.addAction(ok)
                        vc.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
