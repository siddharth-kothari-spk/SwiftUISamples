//
//  ContentView.swift
//  ShimmerEffect2
//
//  Created by Siddharth Kothari on 11/12/24.
//

// https://www.linkedin.com/posts/su-codee-676946321_swiftui-shimmereffect-with-textrenderer-activity-7272558294156603393-9-wy?utm_source=share&utm_medium=member_desktop

import SwiftUI

struct ContentView: View {
    @State var moveFrom = false
    var body: some View {
        ZStack {
            Text("Get started")
                .font(.title.bold())
                .foregroundStyle(.gray.opacity(0.2))
            
            if #available(iOS 18.0, *) {
                Text("Get started")
                    .font(.title.bold())
                    .textRenderer(ShimmerEffect(animationInProgress: moveFrom ? 3 : -1))
            } else {
                // Fallback on earlier versions
            }
        }
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(.gray.tertiary, in: Capsule())
        .padding()
        .onAppear {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                moveFrom.toggle()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
