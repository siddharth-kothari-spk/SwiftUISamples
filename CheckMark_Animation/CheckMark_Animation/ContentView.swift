//
//  ContentView.swift
//  CheckMark_Animation
//
//  Created by Siddharth Kothari on 04/11/24.
//
// courtsey: sucodee
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-checkmark-animation-activity-7258812361073991680-vAAR/

import SwiftUI

struct ContentView: View {
    @State var isTapped = false
    @State var isAnimated = false
    
    var body: some View {
        ZStack {
            ForEach(0..<6) { index in
                Circle()
                    .frame(width: 30, height: 30)
                    .scaleEffect(isAnimated ? 0 : 1)
                    .offset(y: isAnimated ? -50 : 0)
                    .rotationEffect(.degrees(Double(index) * 60))
                    //.opacity(isAnimated ? 1 : 0) // not needed
            }
            Image(systemName: isTapped ? "checkmark.circle" : "circle")
                .contentTransition(.symbolEffect)
                .font(.largeTitle)
        }
        .foregroundStyle(isTapped ? .indigo : .blue)
        .onTapGesture {
            withAnimation(.spring(duration: 1)) {
                isTapped.toggle()
            }
            withAnimation(isTapped ? .spring(duration: 1) : .none) {
                isAnimated.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
