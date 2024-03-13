//
//  ContentView.swift
//  CheckOrientation
//
//  Created by Siddharth Kothari on 13/03/24.
//

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation

import SwiftUI

struct ContentView: View {
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
