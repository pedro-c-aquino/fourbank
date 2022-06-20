//
//  AccountScreenViewModel.swift
//  FourBank
//
//  Created by user220210 on 6/13/22.
//

import Foundation

class AccountScreenViewModel {
    
    func getUser() -> [String: Any]? {
        var userDict: [String: Any]?
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            print("Invalid URL")
            return nil
        }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dict = json as? [String: Any] {
                        //FOR SINGLE VALUES
                            DispatchQueue.main.async {
                                userDict = dict
                            }
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
        return userDict
    }
}
