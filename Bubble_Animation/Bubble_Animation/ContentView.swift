//
//  ContentView.swift
//  Bubble_Animation
//
//  Created by Siddharth Kothari on 13/11/24.
//
// courtsey: https://www.linkedin.com/posts/su-codee-676946321_swiftui-iosdeveloper-activity-7262431482722332673-e7ZP?utm_source=share&utm_medium=member_desktop

import SwiftUI

struct ContentView: View {
    @State private var bubbles: [Bubble] = []
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func createBubbles() {
        for _ in 0..<100 {
            let size = CGFloat.random(in: 5...15)
            let positionX = CGFloat.random(in: 0...UIScreen.main.bounds.width)
            let positionY = UIScreen.main.bounds.height + size
            let speed = Double.random(in: 4.0...8.0)
            let opacity = Double.random(in: 0.5...1.0)
            let bubble = Bubble(size: size, positionX: positionX, positionY: positionY, speed: speed, opacity: opacity)
            bubbles.append(bubble)
        }
    }
    
    func animateBubble(at index: Int) {
        let delay = Double.random(in: 0...5)
        var bubble = bubbles[index]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: DispatchWorkItem(block: {
            withAnimation(.easeOut(duration: bubble.speed)) {
                bubble.positionY = -100
                bubble.opacity = 0
                bubbles[index] = bubble
            }
        }))
    }
}

#Preview {
    ContentView()
}
