//
//  TransferScreen1ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import Foundation

class PixScreen1VM {
    
    func getAmount(amountText: String?) -> Double {
        
        let amountString = amountText ?? "0.00"
        let convertedString = amountString.replacingOccurrences(of: ",", with: ".")
        let amount = Double(convertedString)
        return amount ?? 0.00
    }
}
