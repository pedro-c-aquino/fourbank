//
//  AccountScreenViewModel.swift
//  FourBank
//
//  Created by user220210 on 6/13/22.
//

import Foundation

class AccountScreenViewModel {
    
    func networkUser(completionHandler: @escaping ([AccountModel]?, Error?) -> Void) -> Void {
       
        guard let url = URL(string: "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account2") else {
            print("Invalid URL")
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    
                    let jsonArray = try JSONDecoder().decode([AccountModel].self, from: data)
                    completionHandler(jsonArray, nil)
                    
                } catch {
                    completionHandler(nil, error)
                }
            }
        }
        task.resume()
    }
}

