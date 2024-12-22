//
//  ContentView.swift
//  TimeLineViewSample
//
//  Created by Siddharth Kothari on 21/12/24.
//
// https://swiftwithmajid.com/2022/05/18/mastering-timelineview-in-swiftui/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // The animation schedule is the system-provided scheduler that uses animation duration on the current platform and reevaluates its body very often to provide a nice transition.
            TimelineView(.animation) { timeLineViewContext in
                let value = secondsValue(for: timeLineViewContext.date)
                Circle()
                    .trim(from: 0, to: value)
                    .stroke(lineWidth: 5)
                    .padding()
                    .frame(width: 200, height: 200)
            }
            
            // The cadence represents the rate at which TimelineView updates, and it might change many times during the view’s lifecycle. For example, running the TimelineView on Apple Watch might decrease cadence while the user lowers the wrist. Fortunately, the Cadence type conforms to Comparable protocol, and we can easily compare them.
            TimelineView(.animation) { context in
                       let date = context.date
                       let value = context.cadence >= .live ?
                           nanosValue(for: date): secondsValue(for: date)
           // .live: Updates the view continuously.
                       Circle()
                    .trim(from: 0, to: value)
                           .stroke()
                           .frame(width: 200, height: 200)
                   }
        }
    }
    private func secondsValue(for date: Date) -> Double {
            let seconds = Calendar.current.component(.second, from: date)
            return Double(seconds) / 60
        }
    
    private func nanosValue(for date: Date) -> Double {
            let seconds = Calendar.current.component(.second, from: date)
            let nanos = Calendar.current.component(.nanosecond, from: date)
            return Double(seconds * 1_000_000_000 + nanos) / 60_000_000_000
        }
}

#Preview {
    ContentView()
}
