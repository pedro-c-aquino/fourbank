//
//  LoginModel.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import Foundation

struct Account: Codable {
    var number: String
    var bankOffice: String
    var savingsAccountBalance: Double
    var checkingAccountBalance: String
    var client: Client
    var id: Int64
    var pix: Pix
    
}

struct Pix: Codable {
    var cpf: String
    var email: String
    var cellphone: String
    var randomKey: String
}
    
struct Client: Codable {
    var id: Int
    var cpf: String
    var name: String
    var birthDate: String
    var type: Type
    var address: Address
    var password: String
    var cellphoneNumber: String
    var rg: String
}
    
enum Type: Codable {
        case Basic
        case Super
        case Premium
    }

struct Address: Codable {
    var street: String	
    var number: String
    var cep: String
    var neighborhood: String
    var city: String
    var state: String
}

struct Transaction: Codable {
    var id: String
    var value: Double
    var date: String
    var Account: Account
}
