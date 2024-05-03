//
//  ContentView.swift
//  CustomStyles
//
//  Created by Siddharth Kothari on 03/05/24.
//

// courtsey: https://blog.stackademic.com/swiftui-reusable-custom-style-4-ways-9ea3473e8e9b

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
