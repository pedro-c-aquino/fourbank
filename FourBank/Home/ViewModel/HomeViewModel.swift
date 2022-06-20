//
//  HomeViewModel.swift
//  FourBank
//
//  Created by user220237 on 6/6/22.
//

import UIKit

class HomeViewModel: UIViewController {
    
    func getAmount(amountText: String?) -> String {
        
        let amountString = amountText ?? "0.00"
        let convertedString = amountString.replacingOccurrences(of: ".", with: ",")
        let amount = convertedString
        return amount
    }
}
