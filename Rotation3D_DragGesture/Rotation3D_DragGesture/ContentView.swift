//
//  ContentView.swift
//  Rotation3D_DragGesture
//
//  Created by Siddharth Kothari on 28/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-rotation3deffect-and-draggesture-activity-7267486214839033857-vwDs/
import SwiftUI

struct ContentView: View {
    @State var valueTransition: CGSize = .zero
    @State var isDragging = false
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 550)
                .offset(x: valueTransition.width / 10, y: valueTransition.height / 10)
                .opacity(0.5)
                .clipShape(.ellipse)
            
            Image("front")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .offset(x: valueTransition.width / 5, y: valueTransition.height / 5)
                .opacity(0.7)
            
        }
    }
}

#Preview {
    ContentView()
}
