//
//  ContentView.swift
//  LoadingAnimation2
//
//  Created by Siddharth Kothari on 03/05/25.
//
// courtsey: https://www.linkedin.com/posts/su-codee-676946321_swiftui-loading-animation-activity-7323659356183429120-TyKy?utm_source=share&utm_medium=member_desktop&rcm=ACoAAANKgeABRYhGDBPe_zPH-v22kh4SYCyDY2Q

import SwiftUI

struct ContentView: View {
    @State var start = false
    
    var body: some View {
        ZStack {
            Text("Loading...")
                .font(.largeTitle.bold())
                .foregroundStyle(.black)
            
            Text("Loading...")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
                .frame(width: 200, height: 50)
                .background(.black)
                .mask {
                    Circle()
                        .frame(width: 40, height: 40)
                        .offset(x: start ? -60 : 60)
                }
            
            Circle()
                .stroke(.black, lineWidth: 5)
                .frame(width: 40, height: 40)
                .offset(x: start ? -60 : 60)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                start = true
            }
        }
    }
}

#Preview {
    ContentView()
}
