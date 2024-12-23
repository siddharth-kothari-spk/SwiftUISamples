//
//  ContentView.swift
//  ActivityCard
//
//  Created by Siddharth Kothari on 23/12/24.
//

// https://www.linkedin.com/posts/su-codee-676946321_swiftui-uiux-activitycard-activity-7276573814363209728-Arda/
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Card(icon: "pencil", title: "Pencil", backgroundColour: .blue)
                Card(icon: "figure.walk", title: "Walking", backgroundColour: .orange)
                Card(icon: "flame.fill", title: "Workout", backgroundColour: .red)
            }
            .padding()
            
            HStack {
                Card(icon: "figure.stairs", title: "Steps", backgroundColour: .green)
                Card(icon: "figure.yoga", title: "Yoga", backgroundColour: .pink)
                Card(icon: "dumbbell.fill", title: "Lift", backgroundColour: .teal)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
