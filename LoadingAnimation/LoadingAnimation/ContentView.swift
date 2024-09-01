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
        HStack(spacing: 6, content: {
            ForEach(0..<colours.count) { index in
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(colours[index])
                    .frame(width: 5, height: currentIndex == index ? 100 : 5 )
            }
        })
        .onAppear(perform: {
            startAnimation()
        })
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            currentIndex = (currentIndex + 1) % colours.count
        }
    }
}

#Preview {
    ContentView()
}
