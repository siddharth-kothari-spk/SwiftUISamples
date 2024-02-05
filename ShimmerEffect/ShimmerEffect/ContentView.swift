//
//  ContentView.swift
//  ShimmerEffect
//
//  Created by Siddharth Kothari on 05/02/24.
//

// courtsey: https://medium.com/@felipaugsts/skeleton-shimmer-in-swiftui-a6668194f6c5

import SwiftUI

struct ContentView: View {
    @State private var testBool = false
    var body: some View {
        VStack {
            Toggle("Toggle Switch", isOn: $testBool)
                    .padding()
                        
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                .foregroundStyle(.tint)
                
                Text("Hello, world!").font(.system(size: 50))
            }.shimmer(when: $testBool)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
