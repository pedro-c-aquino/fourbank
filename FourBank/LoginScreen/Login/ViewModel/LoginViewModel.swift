//
//  LoginViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation

class LoginViewModel {
    
    func validateLoginData(email: String?, password: String?) -> (email: String, password: String, validation: Bool) {
        
        if let email = email, let password = password {
            return (email: email, password: password, validation: true)
        } else {
            return (email: "", password: "", validation: false)
        }
    }
}
