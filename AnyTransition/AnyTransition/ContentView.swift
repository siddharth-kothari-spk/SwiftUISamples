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
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                currentIndex = (currentIndex + 1) % items.count
            }
        }
    }
    
    var body: some View {
        HStack(spacing: 4) {
            Text("Loading")
            
            ZStack {
                ForEach(0..<items.count, id: \.self) { index in
                    if index == currentIndex {
                        Text(items[index])
                            .bold()
                    }
                }
            }
            .frame(width: 70, height: 30, alignment: .leading)
            .clipped() // used to see items in height 30 only
        }
        .onAppear {
            startTimer()
        }
    }
}

#Preview {
    ContentView()
}
