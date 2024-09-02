//
//  ContentView.swift
//  LoadingAnimation
//
//  Created by Siddharth Kothari on 01/09/24.
//

// courtsey: https://x.com/sucodeee/status/1819715043241410982

import SwiftUI

struct ContentView: View {
    @State var currentIndex = 0
    let colours: [Color] = [.orange, .blue, .red, .cyan, .yellow, .green]
    var body: some View {
        VStack {
            HStack(spacing: 6, content: {
                ForEach(0..<colours.count) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(colours[index])
                        .frame(width: 5, height: currentIndex == index ? 100 : 5 )
                }
                .animation(.spring(duration: 0.9), value: currentIndex)
                // check extension Animation for more options
            })
            .onAppear(perform: {
                startAnimation()
        })
            
            HStack(spacing: 6, content: {
                ForEach(0..<colours.count) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(colours[index])
                        .frame(width: 5, height: currentIndex == index ? 100 : 5 )
                }
                .animation(.bouncy(duration: 0.15, extraBounce: 0.15), value: currentIndex)
                // check extension Animation for more options
            })
            .onAppear(perform: {
                startAnimation2()
        })
        }
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            currentIndex = (currentIndex + 1) % colours.count
        }
    }
    
    func startAnimation2() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            currentIndex = (currentIndex + 1) % colours.count
        }
    }
}

#Preview {
    ContentView()
}
