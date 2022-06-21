//
//  RegisterScreen4ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import Foundation

class RegisterScreen4ViewModel {
    
    func checkPassword(password: String, confirmPassword: String) -> Bool {
        
        if password == confirmPassword {
            
            return true
        }
        return false
    }
    
}
