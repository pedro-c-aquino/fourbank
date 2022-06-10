//
//  UserModel.swift
//  FourBank
//
//  Created by user208023 on 6/6/22.
//

import Foundation

struct UserPersonalInfo {
    var firstName: String?
    var lastName: String?
    var cpf: String?
    var rg: String?
}

struct UserPersonalAddress {
    var address: String?
    var city: String?
    var state: String?
    var zipcode: String?
}

struct UserLoginInfo {
    var email: String?
    var password: String?
}

