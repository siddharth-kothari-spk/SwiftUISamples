//
//  ContentView.swift
//  AnyTransition
//
//  Created by Siddharth Kothari on 28/12/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-anytransition-activity-7278390677590196224-YTnF/?utm_source=share&utm_medium=member_ios

import SwiftUI

struct ContentView: View {
    var items = ["Buttons", "Images", "Cards", "Forms", "Text"]
    var colors: [Color] = [.red, .green, .blue, .orange, .teal]
    @State var currentIndex = 0
    
    // AnyTransition: Transition ->
    /// A description of view changes to apply when a view is added to and removed from the view hierarchy.
    var customTransition: AnyTransition {
        AnyTransition.asymmetric(insertion: .offset(y: 50).combined(with: .opacity), removal: .offset(y: -50).combined(with: .opacity))
    }
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
