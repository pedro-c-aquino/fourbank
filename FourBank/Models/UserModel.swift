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
    var cellphoneNumber: String
    var cep: String
    var city: String
    var cpf: String
    var email: String
    var name: String
    var neighborhood: String
    var rg: String
    var street: String
    var state: String
    var accountBalance: Int
    var bank: String
    var password: String
    var birthDate: String
    var number: String
    var cpfPix: String
    var emailPix: String
    var cellphonePix: String
    var id: String
    var transfers: [Transfer]
    var pixContacts: [PixContact]
}

struct PixContact: Codable {
    var name: String
    var keyType: String
    var pixKey: String
}

struct PixContactModel: Codable {
    var pixContacts: [PixContact]
}

struct Transfer: Codable {
    
    var amount: Double
    var transferType: String
}

struct TransferPutModel: Codable {

    var accountBalance: Int
    var transfers: [Transfer]
}

//==================

struct CurrentUser {
    
    static var currentUserEmail = ""
    
    static var receivedData: Data?
    
    static var userArray: [UserModel]?
    
    static var userPixContactsArray: [UserModel]?
    
}
