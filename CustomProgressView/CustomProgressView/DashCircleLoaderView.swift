//
//  DashCircleLoaderView.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//


/*
 This is the same with the ModernCircularLoader, You just need to use ZStack and use 2 dotted circles and the first circle color will be light, and the second circle color will be dark.
 */
import SwiftUI

struct DashCircleLoaderView: View {
    @State private var trimEnd = 0.6
    @State private var degree = 270
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .butt, miterLimit: 0, dash: [10, 3], dashPhase: 0))
                .foregroundColor(.black.opacity(0.2))

            Circle()
                .trim(from: 0.0, to: trimEnd)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .butt, miterLimit: 0, dash: [10, 3], dashPhase: 0))
                .animation(
                    Animation.easeIn(duration: 1.5)
                        .repeatForever(autoreverses: true),
                    value: trimEnd
                )
                .rotationEffect(Angle(degrees: Double(degree)))
                .animation(
                    Animation.linear(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: degree
                )
                .onAppear{
                    degree = 270 + 360
                    trimEnd = 0
                }
        }
        .frame(width: 70,height: 70)
    }
}

#Preview {
    DashCircleLoaderView()
}
