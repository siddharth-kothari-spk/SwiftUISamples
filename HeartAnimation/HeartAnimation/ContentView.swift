//
//  ContentView.swift
//  HeartAnimation
//
//  Created by Siddharth Kothari on 08/12/24.
//

// https://www.linkedin.com/posts/su-codee-676946321_swiftui-heart-animation-activity-7270383909991780352-7ysf/
import SwiftUI

struct ContentView: View {
    @State var isTapped = false
    @State var isAnimated = false
    
    var body: some View {
        ZStack {
            ForEach(0..<6) {index in
                    RoundedRectangle(cornerRadius: 2)
                    .frame(width: 4, height: .random(in: 10...30))
                    .foregroundStyle(.pink)
                    .offset(y: isAnimated ? -70 : 0)
                    .rotationEffect(.degrees(Double(index) * 60))
            }
            
            Image(systemName: isTapped ? "heart.fill" : "heart")
                .foregroundStyle(isTapped ? .pink : .red)
                .contentTransition(.symbolEffect)
                .font(.largeTitle)
                .onTapGesture {
                    withAnimation(.spring(duration: 0.8)) {
                        isTapped.toggle()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
