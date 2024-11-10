//
//  ContentView.swift
//  SwiftUI_Mask
//
//  Created by Siddharth Kothari on 10/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-iosdeveloper-activity-7261328524307759104-HPSe?utm_source=share&utm_medium=member_desktop

import SwiftUI

struct ContentView: View {
    let gradientColors: [Color] = [.red, .orange, .blue, .yellow, .green, .purple, .pink]
    @State var degrees: Double = 0
    
    var body: some View {
        ZStack(content: {
            Circle()
                .stroke(lineWidth: 25) // to create donut shape
                .frame(width: 150, height: 150)
                .foregroundStyle(.gray.opacity(0.3))
            
            Circle()
                .stroke(lineWidth: 25)
                .frame(width: 150, height: 150)
                .foregroundStyle(AngularGradient.init(gradient: Gradient(colors: gradientColors), center: .center, angle: .degrees(0)))
                .mask {
                    Circle()
                        .trim(from: 0.0, to: 0.15)
                        .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.degrees(degrees))
                }
        })
        .onAppear(perform: {
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                degrees += 360
            }
        })
    }
}

#Preview {
    ContentView()
}
