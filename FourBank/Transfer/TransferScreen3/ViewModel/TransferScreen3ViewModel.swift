//
//  TransferScreen3ViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/15/22.
//

import UIKit

class TransferScreen3ViewModel {

    func getAmountString(amount: Double) -> String {
        let amountConverted = String(format: "%.2f", amount)
        let amountString = "R$ " + amountConverted.replacingOccurrences(of: ".", with: ",")
        
        return amountString
    }
}
