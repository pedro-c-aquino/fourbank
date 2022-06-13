//
//  RegisterScreen1ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation

class RegisterScreen1ViewModel {
    
    func registerPersonalInfo(firstName: String?, lastName: String?, cpf: String?, rg: String?) {
        let userPersonalInfo = UserPersonalInfo(firstName: firstName, lastName: lastName, cpf: cpf, rg: rg)
    }
    
}
