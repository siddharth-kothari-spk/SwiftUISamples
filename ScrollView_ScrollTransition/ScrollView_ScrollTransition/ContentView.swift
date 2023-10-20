//
//  ContentView.swift
//  ScrollView_ScrollTransition
//
//  Created by Siddharth Kothari on 20/10/23.
//
// courtsey: https://santoshbotre01.medium.com/elevate-your-apps-user-experience-exploring-scrollview-scrolltransition-api-in-swiftui-with-ios-2c259025fab2

// Developers use the ScrollView design screen by adding children's views into it when it needs scrolling capability.

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            ForEach(Shapes.dummyShapes) { dummyShape in
                Image(systemName: dummyShape.title)
                  .resizable()
                  .imageScale(.medium)
                  .frame(height: 300)
                  .cornerRadius(16)
                  .foregroundColor(dummyShape.color)
                  .padding(.horizontal)
              }
            }
    }
}

#Preview {
    ContentView()
}
