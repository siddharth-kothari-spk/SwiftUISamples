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
    
    static var startOfWeek: Date {
        let calendar = Calendar.current
        let weekStart = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))
        let startOfWeek = calendar.date(byAdding: .day, value: 1 - calendar.component(.weekday, from: weekStart!), to: weekStart!)!
        return startOfWeek
    }
}
