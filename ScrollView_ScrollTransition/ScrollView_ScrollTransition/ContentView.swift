//
//  ContentView.swift
//  ScrollView_ScrollTransition
//
//  Created by Siddharth Kothari on 20/10/23.
//
// courtsey: https://santoshbotre01.medium.com/elevate-your-apps-user-experience-exploring-scrollview-scrolltransition-api-in-swiftui-with-ios-2c259025fab2

// Developers use the ScrollView design screen by adding children's views into it when it needs scrolling capability.

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
