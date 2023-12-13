//
//  ContentView.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

// courtsey: https://blog.stackademic.com/custom-progressview-in-swiftui-c94f51ba598b

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            HStack(content: {
                CircularLoaderView()
                RotateImageLoaderView()
            }).padding()
            
            HStack(content: {
                RotateCircleAroundCircle()
                MultiCircleLoaderView()
                SquareLoaderView()
            }).padding()
            
            HStack(content: {
                AnimatedStrokeRectangle()
                AnimatedStrokeTriangle()
                AnimatedStrokeCircle()
            }).padding()
            
            HStack(content: {
                CircleFillLoaderView()
                CirclesLoaderView()
                ModernCircularLoader()
            })
            
            DashCircleLoaderView()
            BottomToTopFill()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
