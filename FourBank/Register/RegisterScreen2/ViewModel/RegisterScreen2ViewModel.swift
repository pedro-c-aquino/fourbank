//
//  RegisterScreen2ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation

class RegisterScreen2ViewModel {
    
    func registerPersonalInfo(address: String?, city: String?, state: String?, zipcode: String?) {
        let userPersonalAddress = UserPersonalAddress(address: address, city: city, state: state, zipcode: zipcode)
    }
    
}
