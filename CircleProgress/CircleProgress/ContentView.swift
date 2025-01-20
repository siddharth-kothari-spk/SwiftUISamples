//
//  ContentView.swift
//  CircleProgress
//
//  Created by Siddharth Kothari on 20/01/25.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-activity-7285614955481939969-nrR3/?utm_source=share&utm_medium=member_ios

import SwiftUI

struct ContentView: View {
    @State var progress: CGFloat = 0.1
    @State var percentage: Int = 0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .foregroundStyle(.gray.opacity(0.4))
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .miter))
                .rotationEffect(.degrees(-90))
                .foregroundStyle(.blue.gradient)
        }
        .frame(width: 300, height: 300)
    }
}

#Preview {
    ContentView()
}
