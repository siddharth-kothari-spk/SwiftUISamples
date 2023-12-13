//
//  RotateImageLoaderView.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

import SwiftUI

struct RotateImageLoaderView: View {
    @State private var animate = false
    var body: some View {
        Image(systemName: "gear")
            .resizable()
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: animate ? 370 : 0))
            .animation(
                .linear(duration: 1)
                .repeatForever(autoreverses: false),
                value: animate
            )
            .onAppear {
                withAnimation {
                    animate.toggle()
                }
            }
    }
}

#Preview {
    RotateImageLoaderView()
}
