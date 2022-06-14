//
//  UserModel.swift
//  FourBank
//
//  Created by user208023 on 6/6/22.
//

import Foundation

struct CurrentUser {
    
    static var currentUserEmail = ""
    
    static func getUser(users: [User], email: String) -> User? {
        for user in users {
            if user.email == email {
                return user
            }
        }
        return nil
    }
}

struct Users: Decodable {
    var users: [User]
}

struct User: Decodable {
    var id: Int
    var nome: String
//    var idade: Int
    var cpf: String
    var rg: String
//    var data_nasc: String
//    var sexo: String
//    var mae: String
//    var pai: String
    var email: String
    var senha: String
    var cep: String
    var endereco: String
    var numero: Int
//    var bairro: String
    var cidade: String
    var estado: String
//    var telefone_fixo: String
//    var celular: String
    var banco: [Banco]
}

struct Banco: Decodable {
    var conta: String
    var agencia: String
    var banco: String
    var cidade: String
    var estado: String
    var saldo: Double
    
}

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
//struct UserPersonalInfo {
//    var firstName: String?
//    var lastName: String?
//    var cpf: String?
//    var rg: String?
//}
//
//struct UserPersonalAddress {
//    var address: String?
//    var city: String?
//    var state: String?
//    var zipcode: String?
//}
//
//struct UserLoginInfo {
//    var email: String?
//    var password: String?
//}

