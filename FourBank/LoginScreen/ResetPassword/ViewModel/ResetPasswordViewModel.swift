//
//  ResetPasswordViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/17/22.
//

import Foundation

class ResetPasswordViewModel {
    
    func validatePassword(password: String?) -> (password: String, validation: Bool) {
        
        if let password = password {
            return (password: password, validation: true)
        } else {
            return (password: "", validation: false)
        }
    }
}
