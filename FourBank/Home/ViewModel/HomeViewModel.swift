//
//  HomeViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import UIKit

class HomeViewModel: UIViewController {
    
    func getAmount(amountDouble: Double?) -> String {
        
        let amountText = String(format: "%.2f", amountDouble ?? 0.00)
        let convertedString = amountText.replacingOccurrences(of: ".", with: ",")
        let amount = convertedString
        return amount
    }
}
