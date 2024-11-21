//
//  ContentView.swift
//  TypingEffect
//
//  Created by Siddharth Kothari on 21/11/24.
//

// https://www.linkedin.com/posts/su-codee-676946321_swiftui-iosdeveloper-swift-activity-7264978645629173761-U2R2/?utm_source=share&utm_medium=member_ios

import SwiftUI

struct ContentView: View {
    @State var displayItem = ""
    @State var show = false

    let fullItem = "My name is Nikku. \nMy name is Nikku"
    let typingSpeed = 0.15
    
    var body: some View {
        HStack {
            Text(displayItem)
                .font(.largeTitle.monospacedDigit())
            
            Rectangle()
                .frame(width: 5, height: 100)
                .opacity(show ? 1 : 0)
        }
        .foregroundStyle(.orange.opacity(0.8))
        .onAppear(perform: {
            withAnimation(.linear(duration: 0.5)) {
                show.toggle()
            }
        typingEffect()
        })
    }
    
    func typingEffect() {
        displayItem = ""
        for (index, character) in fullItem.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + typingSpeed * Double(index), execute: DispatchWorkItem(block: {
                    displayItem.append(character)
                if index == fullItem.count - 1 {
                    show = false
                }
                else {
                    show.toggle()
                }
            }))
        }
    }
}

#Preview {
    ContentView()
}
