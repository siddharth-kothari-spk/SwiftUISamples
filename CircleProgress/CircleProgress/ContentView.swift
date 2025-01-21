//
//  ContentView.swift
//  CircleProgress
//
//  Created by Siddharth Kothari on 20/01/25.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-activity-7285614955481939969-nrR3/?utm_source=share&utm_medium=member_ios
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-progress-ring-activity-7282722621505355777--h0V/

import SwiftUI

struct ContentView: View {
    @State var progress: CGFloat = 0.1
    @State var percentage: Int = 10
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .foregroundStyle(.gray.opacity(0.4))
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 50, lineCap: .round, lineJoin: .miter))
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue, .green, .yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Rectangle()
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue, .green, .yellow, .red]), startPoint: .top, endPoint: .bottom))
                .frame(width: 100, height: 100)
            
            Text("\(percentage)%")
                .font(.title).bold()
                .foregroundStyle(.black)
        }
        .frame(width: 300, height: 300)
        .onAppear {
            withAnimation(.linear(duration: 5)) {
                progress = 1.0
            }
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                if percentage < 100 {
                    percentage += 1
                }
                else {
                    timer.invalidate()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
