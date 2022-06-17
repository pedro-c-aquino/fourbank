//
//  TransferScreen1ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import Foundation

class TransferScreen1ViewModel {

    func getAmount(amountText: String?) -> Double {
        
        let amountString = amountText ?? "0.00"
        let convertedString = amountString.replacingOccurrences(of: ",", with: ".")
        let amount = Double(convertedString)
        return amount ?? 0.00
    }

}
