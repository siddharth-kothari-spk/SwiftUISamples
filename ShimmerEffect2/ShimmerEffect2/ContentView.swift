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
