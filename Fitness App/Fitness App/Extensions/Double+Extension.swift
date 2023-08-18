//
//  Double+Extension.swift
//  Fitness App
//
//  Created by Siddharth Kothari on 18/08/23.
//

import Foundation

extension Double {
    func formatToString() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: self))
    }
}
