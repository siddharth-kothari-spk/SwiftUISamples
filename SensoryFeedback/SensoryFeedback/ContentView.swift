//
//  ContentView.swift
//  SensoryFeedback
//
//  Created by Siddharth Kothari on 13/09/24.
//

// courtsey: https://www.linkedin.com/posts/learn-and-code-with-enid_swiftui-tip-easily-generate-haptic-feedback-activity-7239966626685583360-xd7q?utm_source=share&utm_medium=member_desktop
import SwiftUI

struct ContentView: View {
    @State private var trigger = false
    var body: some View {
        Button("Trigger feedback") {
            trigger = true
        }
        .sensoryFeedback(.impact, trigger: trigger)
        .font(.largeTitle)
        .bold()
    }
}

#Preview {
    ContentView()
}
