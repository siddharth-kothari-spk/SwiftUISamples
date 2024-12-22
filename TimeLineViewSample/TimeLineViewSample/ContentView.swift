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
                    .foregroundStyle(.red)
            }
            
            // The cadence represents the rate at which TimelineView updates, and it might change many times during the view’s lifecycle. For example, running the TimelineView on Apple Watch might decrease cadence while the user lowers the wrist. Fortunately, the Cadence type conforms to Comparable protocol, and we can easily compare them.
            TimelineView(.animation) { context in
                   let date = context.date
                   let value = context.cadence >= .live ?
                       nanosValue(for: date): secondsValue(for: date)
           // .live: Updates the view continuously.
                    Circle()
                    .trim(from: 0, to: value)
                    .stroke(lineWidth: 5)
                    .padding()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.blue)
                   }
            
            
            // Schedulers: SwiftUI provides us with  two schedulers: everyMinute and periodic scheduler. The everyMinute scheduler updates the timeline every minute. The periodic scheduler allows us to give a start date and interval, after which another update event should be fired.
            
            TimelineView(.periodic(from: .now, by: 5)) { timeLineViewContext in
                let value = secondsValue(for: timeLineViewContext.date)

               Circle()
                   .trim(from: 0, to: value)
                   .stroke(lineWidth: 5)
                   .padding()
                   .frame(width: 200, height: 200)
                   .foregroundStyle(.green)

            }
            
            TimelineView(.daily) { timeLineViewContext in
                let value = dayValue(for: timeLineViewContext.date)
                Circle()
                    .trim(from: 0, to: value)
                    .stroke(lineWidth: 5)
                    .padding()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.orange)
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
    
    private func dayValue(for date: Date) -> Double {
        /// timeIntervalSinceNow: Returns a `Date` initialized relative to the current date and time by a given number of seconds.
        //let day = Calendar.current.component(.day, from: .init(timeIntervalSinceNow: -(86400 * 7))) // to go to past date
        
        let day = Calendar.current.component(.day, from: date)
            return Double(day) / 30
        }
}

#Preview {
    ContentView()
}
