//
//  ContentView.swift
//  SF Symbols animation
//
//  Created by Siddharth Kothari on 02/10/23.
//

// courtsey: https://blorenzop.medium.com/how-to-animate-sf-symbols-in-swiftui-c3b504af4f44

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
