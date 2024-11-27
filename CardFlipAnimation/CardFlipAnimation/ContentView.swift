//
//  ContentView.swift
//  CardFlipAnimation
//
//  Created by Siddharth Kothari on 27/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_iosdeveloper-swiftui-swift-activity-7266793410198429696-ZsUs/
import SwiftUI

struct ContentView: View {
    @State var flip = false
    @State var flip2 = false
    
    var body: some View {
        ZStack {
            Image(.card1)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 400)
                .zIndex(flip2 ? 1: 0)
            
            Image(.card2)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 400)
        }
        .clipShape(.rect(cornerRadius: 24))
        .rotation3DEffect(
            .degrees(flip ? 180 : 0),
                                  axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .onTapGesture(perform: {
            withAnimation(.spring(duration: 1.0)) {
                flip.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring(duration: 1.0)) {
                    flip2.toggle()
                }
            }
        })
    }
}

#Preview {
    ContentView()
}
