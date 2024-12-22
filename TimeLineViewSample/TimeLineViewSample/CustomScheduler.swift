//
//  CustomScheduler.swift
//  TimeLineViewSample
//
//  Created by Siddharth Kothari on 22/12/24.
//

import Foundation
import SwiftUI

//We need to create a type conforming to the TimelineSchedule protocol and implement a single requirement

/// A type that provides a sequence of dates for use as a schedule.

final class DailySchedule: TimelineSchedule {
    typealias Entries = [Date]
    
    func entries(from startDate: Date, mode: Mode) -> [Date] {
        (1...30).map { value in
            startDate.addingTimeInterval(Double(value * 24 * 3600))
        }
    }
}

extension TimelineSchedule where Self == DailySchedule {
    static var daily: Self { .init() } // created for easy usage
}
