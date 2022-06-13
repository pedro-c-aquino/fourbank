//
//  RegisterScreen3ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import UIKit

class RegisterScreen3ViewModel {
    
    func registerUser(email: String?, password: String?, confirmPassword: String?) -> (email: String, password: String, validation: Bool) {
        if let email = email, let password = password, let confirmPassword = confirmPassword {
            if password == confirmPassword {
                return (email: email, password: password, validation: true)
            } else {
                return (email: "", password: "", validation: false)
            }
        }
        return (email: "", password: "", validation: false)
    }
}
