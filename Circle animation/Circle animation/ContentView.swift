//
//  ContentView.swift
//  Circle animation
//
//  Created by Siddharth Kothari on 20/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var spin = false
    @State var scale = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 3.0)
                .frame(width: 250, height: 250)
                .foregroundStyle(.gray.opacity(0.3))
            
            Image(systemName: "eraser")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .scaleEffect(scale ? 1 : 0.9)
            
            Group {
                Circle()
                    .trim(from: 0.0, to: 0.12)
                    .stroke(style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                    .frame(width: 250, height: 250)
                    .foregroundStyle(.pink)
                
                Circle()
                    .trim(from: 0.0, to: 0.12)
                    .stroke(style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                    .frame(width: 250, height: 250)
                    .rotationEffect(.degrees(-180))
                    .foregroundStyle(.blue)
            }
            .rotationEffect(.degrees(spin ? 360 : 0))
        }
        .onAppear(perform: {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                spin = true
            }
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                scale.toggle()
            }
        })
    }
}

#Preview {
    ContentView()
}
