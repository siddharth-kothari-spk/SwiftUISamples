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
        HStack {
            Card(icon: "pencil", title: "Pencil", backgroundColour: .blue)
            Card(icon: "pencil", title: "Pencil", backgroundColour: .blue)
            Card(icon: "pencil", title: "Pencil", backgroundColour: .blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
