//
//  Date+Extension.swift
//  Fitness App
//
//  Created by Siddharth Kothari on 18/08/23.
//

import Foundation

extension Date {
    static var startOftheDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}
