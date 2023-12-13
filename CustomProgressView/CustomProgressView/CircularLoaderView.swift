//
//  CircularLoaderView.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

/*
 CircularLoaderView

 For creating circular loaded, create a CircularLoaderView struct which will be extended with the SwiftUI View.

 Properties:

     animate: will be used to toggle animation on onAppear.
     gradient: is a simple linear gradient to fill the circle border.

 Main View:

 Inside the body variable create a Circle with stroke and frame. After that apply the rotateEffect if the animate is true then the degree value will be 360 otherwise, it will be 0.

 Now, apply the linear animation with a duration of 1 second on it, when the animate value is changed. repeatForever will repeat that animation forever.

 On appear of that view, toggle the animate value.
 */

import SwiftUI

struct CircularLoaderView: View {
    @State private var animate = false
    
    let gradient = LinearGradient(
        stops: [
            Gradient.Stop(color: .primary, location: 0.1),
            Gradient.Stop(color: .primary.opacity(0.8), location: 0.4),
            Gradient.Stop(color: .primary.opacity(0.4), location: 0.8)
        ],
        startPoint: .leading,
        endPoint: .trailing
    )
    
    var body: some View {
        Circle()
            .stroke(gradient, lineWidth: 8)
            .frame(width: 80, height: 80)
            .rotationEffect(Angle(degrees: animate ? 360 : 0))
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
    CircularLoaderView()
}
