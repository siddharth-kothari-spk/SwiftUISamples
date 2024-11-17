//
//  ContentView.swift
//  GlowText
//
//  Created by Siddharth Kothari on 17/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-iosdeveloper-activity-7263509772019077121-2gR_/

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var color: [Color] = [.indigo, .green, .yellow, .orange, .red]
    var title: [String] = ["Indigo", "Green", "Yellow", "Orange", "Red"]
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
