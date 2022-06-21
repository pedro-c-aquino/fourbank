//
//  Network.swift
//  FourBank
//
//  Created by user220237 on 6/20/22.
//

import Foundation

class Network {
    
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
                    completionHandler(nil, error)
                }
            }
        }
        task.resume()
    }
    
    func registerUser(name: String, birthDate: String, cpf: String, rg: String, email: String, occupation: String, income: String, cellphoneNumber: String, street: String, number: String, neighborhood: String, city: String, state: String, password:String) {
        
        let params = [
            "account": "369874-5",
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
            "number": number
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
                print("The error was: \(error.localizedDescription)")
            } else {
                print(response)
                print(url)
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("Response json is: \(jsonRes)")
            }
        }.resume()
    }
    
    func trasnferAmount(accountBalance: Int, id: String) {
        
        let params = [
            "accountBalance": accountBalance,
        ] as [String : Any]
        
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
                print(response)
                print(url)
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("Response json is: \(jsonRes)")
            }
        }.resume()
    }
 
}
