import Foundation
import UIKit
import Alamofire

class Network {
    
    var userModel: [UserModel] = []
    
    
    func networkUser(completionHandler: @escaping ([UserModel]?, Error?) -> Void) -> Void {
        
        guard let url = URL(string: "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account2") else {
            
            print("Invalid URL")
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                do {
                    
                    let jsonArray: [UserModel] = try JSONDecoder().decode([UserModel].self, from: data)
                    completionHandler(jsonArray, nil)
                    
                } catch {
                    
                    print(error)
                    completionHandler(nil, error)
                }
            }
        }
        task.resume()
    }
    
    
    func registerUser(name: String, birthDate: String, cpf: String, rg: String, email: String, occupation: String, income: String, cellphoneNumber: String, street: String, number: String, neighborhood: String, city: String, state: String, password:String, vc: UIViewController) {
        
        let params = [
            "account": "122265-19",
            "agency": "2040",
            "bank": "Fourbank",
            "cellphoneNumber": cellphoneNumber,
            "city": city,
            "cpf": cpf,
            "email": email,
            "name": name,
            "neighborhood": neighborhood,
            "rg": rg,
            "street": street,
            "state": state,
            "accountBalance": 5000,
            "password": password,
            "birthDate": birthDate,
            "number": number,
            "cpfPix": cpf,
            "emailPix": email,
            "cellphonePix": cellphoneNumber,
            "transfers": [["amount": 5000,"transferType": "Deposito"]],
            "pixContacts": [["name": "Joana", "keyType": "email", "pixKey": "joana@"]]
                        
        ] as [String : Any]
        guard let url = URL(string: "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account2") else {
            
            fatalError("typicode URL not working")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                
                DispatchQueue.main.async {
                    
                    let alert = UIAlertController(title: "Erro ao cadastrar", message: "\(error.localizedDescription)", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(ok)
                    vc.present(alert, animated: true, completion: nil)
                }
            } else {
                
                print(url)
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("Response json is: \(jsonRes)")
                DispatchQueue.main.async {
                    
                    let alert = UIAlertController(title: "Cadastrado", message: "Cliente cadastrado com sucesso!", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
                        
                        vc.performSegue(withIdentifier: "RegScreen4ToMain", sender: self)
                    }
                    alert.addAction(ok)
                    vc.present(alert, animated: true, completion: nil)
                }
            }
        }.resume()
    }
    
    
    func addTransfer(id: String, transferData: TransferPutModel) {
        
        guard let url = URL(string: "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account2/\(id)") else {
            
            fatalError("typicode URL not working")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(transferData)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                
                print("The error was: \(error.localizedDescription)")
            } else {
                
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("Response json is: \(jsonRes)")
            }
        }.resume()
    }
    
    
    func networkUserArray() {
        
        AF.request("https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account2").responseJSON { response in
            
            if let data = response.data {
                
                do {
                    
                    let result: [UserModel] = try JSONDecoder().decode([UserModel].self, from: data)
                    CurrentUser.userArray = result
                } catch {
                    
                    print(error)
                }
            }
        }
    }
    
    
    func addPixContact(id: String, contactData: PixContactModel) {
        
        guard let url = URL(string: "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account2/\(id)") else {
            
            fatalError("typicode URL not working")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(contactData)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                
                print("The error was: \(error.localizedDescription)")
            } else {
                
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("Response json is: \(jsonRes)")
            }
        }.resume()
    }
    
    func resetPassword(password: String, id: String) {
        
        let params = [ "password": password ] as [ String : Any]
        
        guard let url = URL(string: "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account2/\(id)") else {
            
            fatalError("typicode URL not working")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                
                print("The error was: \(error.localizedDescription)")
            } else {
                
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("Response json is: \(jsonRes)")
            }
        }.resume()
    }
}
