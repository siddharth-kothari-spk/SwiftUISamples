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
            }
        }
    }
    private func secondsValue(for date: Date) -> Double {
            let seconds = Calendar.current.component(.second, from: date)
            return Double(seconds) / 60
        }
}

#Preview {
    ContentView()
}
