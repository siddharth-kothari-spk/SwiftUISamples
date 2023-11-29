//
//  GlitchView.swift
//  Glitch-Effect
//
//  Created by Siddharth Kothari on 29/11/23.
//

import SwiftUI

struct GlitchView: View {
    @State private var randomOffset: CGFloat = 0
        @State private var isAnimating = false

    func applyGlitchEffect() {
        let offsets: [CGFloat] = [-40, -20, 20, 40]
        randomOffset = offsets.randomElement() ?? 0
    }
    
    var body: some View {
            Image(systemName: "applelogo")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .offset(x: isAnimating ? randomOffset : 0)
                .colorMultiply(isAnimating ? Color.red : Color.blue)
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
                        isAnimating.toggle()
                        applyGlitchEffect()
                    }
                }
        }
}

#Preview {
    GlitchView()
}
