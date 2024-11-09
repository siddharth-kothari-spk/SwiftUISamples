//
//  ContentView.swift
//  RotatingCard
//
//  Created by Siddharth Kothari on 09/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-rotatingcard-with-rotation3deffect-activity-7260938319356657664-4G01/?utm_source=share&utm_medium=member_ios

import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        ZStack(content: {
            RotatingCardView(imageName: "pic1", rotatingAngle: -60, yOffset: 60, show: show)
            RotatingCardView(imageName: "pic2", rotatingAngle: -60, yOffset: 0, show: show)
            RotatingCardView(imageName: "pic3", rotatingAngle: -60, yOffset: -60, show: show)
        })
        .onTapGesture {
            withAnimation(.bouncy(duration: 0.5, extraBounce: 0.01)) {
                show.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
