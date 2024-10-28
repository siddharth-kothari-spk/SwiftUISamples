//
//  ContentView.swift
//  Masking&InvertedMasking
//
//  Created by Siddharth Kothari on 28/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Masking
            Text("Masking")
                .font(.system(.title))
            Image(.background)
                .resizable()
                .mask {
                    Image(systemName: "apple.logo")
                        .font(.system(size: 200))
                }
                .shadow(color: .blue.opacity(0.5),
                        radius: 15, x: -10, y: 10)
            
            // Inverted Masking
            Text("Inverted Masking")
                .font(.system(.title))
            
            ZStack(content: {
                Image(systemName: "lanyardcard.fill")
                    .font(.system(size: 300))
                    .foregroundStyle(
                        LinearGradient(colors: [.red, .blue], startPoint: .bottomLeading, endPoint: .topTrailing)
                    )
                
                Image(systemName: "apple.logo")
                    .font(.system(size: 150))
                    .blendMode(.destinationOut)
                /// Sets the blend mode for compositing this view with overlapping views.
                /// Use `blendMode(_:)` to combine overlapping views and use a different visual effect to produce the result.
            })
            .compositingGroup() 
            /// A compositing group makes compositing effects in this view's ancestor views, such as opacity and the blend mode, take effect before this view is rendered.
            .shadow(color: .blue.opacity(0.5),
                    radius: 15, x: -10, y: 10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
