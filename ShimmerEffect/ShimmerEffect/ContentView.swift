//
//  ContentView.swift
//  ShimmerEffect
//
//  Created by Siddharth Kothari on 05/02/24.
//

// courtsey: https://medium.com/@felipaugsts/skeleton-shimmer-in-swiftui-a6668194f6c5

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
