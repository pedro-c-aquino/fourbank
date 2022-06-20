//
//  UserModel.swift
//  FourBank
//
//  Created by user208023 on 6/6/22.
//

import Foundation

struct UserModel: Codable {
    var account: String
    var agency: String
    var bank: String
    var cep: String
    var city: String
    var state: String
    var name: String
    var cpf: String
    var rg: String
    var email: String
    var password: String
    var birthDate: String
    var street: String
    var number: String
    var neighborhood: String
    var cellphoneNumber: String
    var cpfPix: String
    var emailPix: String
    var cellPhonePix: String
    var accountBalance: Int
}

//=====================

extension Decodable {
    
    static func parse(jsonFile: String) -> Self {
        
        guard let url = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            fatalError("Error to find json file \(jsonFile)")
        }
        do {
            return try JSONDecoder().decode(self, from: data)
        } catch {
            fatalError("Error to decode json: \(error)")
        }
        
    }
}
