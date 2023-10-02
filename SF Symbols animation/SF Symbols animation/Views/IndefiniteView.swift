//
//  IndefiniteView.swift
//  SF Symbols animation
//
//  Created by Siddharth Kothari on 02/10/23.
//

import SwiftUI
// We control when the animation starts and when the animation stops using symbolEffect(_:options:isActive:)

struct IndefiniteView: View {
    @State private var animationIsActive = false
    
    private var buttonTitle: String {
          return animationIsActive ? "Stop animations" : "Start animations"
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("Pulse")
                Image(systemName: "wifi.router")
                    .symbolEffect(.pulse,
                            isActive: animationIsActive)
            }.padding()
            
            VStack {
                Text("Variable Color")
                Image(systemName: "wifi.router")
                    .symbolEffect(.variableColor,
                            isActive: animationIsActive)
            }.padding()
            
            VStack {
                Text("Scale")
                Image(systemName: "wifi.router")
                    .symbolEffect(.scale,
                            isActive: animationIsActive)
            }.padding()
            
            VStack {
                Text("Appear")
                Image(systemName: "wifi.router")
                    .symbolEffect(.appear,
                            isActive: !animationIsActive)
            }.padding()
            
            VStack {
                Text("Disappear")
                Image(systemName: "wifi.router")
                    .symbolEffect(.disappear,
                            isActive: animationIsActive)
            }.padding()
            
            Button(buttonTitle) {
                animationIsActive.toggle()
            }
        }
    }
}

#Preview {
    IndefiniteView()
}
