//
//  DiscreteView.swift
//  SF Symbols animation
//
//  Created by Siddharth Kothari on 02/10/23.
//

import SwiftUI

struct DiscreteView: View {
    
    @State private var animationCount = 0
    
    var body: some View {
        VStack {
            VStack(content: {
                Text("Bounce")
                Image(systemName: "wifi.router").symbolEffect(.bounce, value: animationCount)
            }).padding()
            
            Button("Animate") {
                animationCount += 1
            }
        }
    }
}

#Preview {
    DiscreteView()
}
