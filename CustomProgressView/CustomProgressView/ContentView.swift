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
            CircularLoaderView()
            RotateImageLoaderView()
            RotateCircleAroundCircle()
            MultiCircleLoaderView()
        }
        .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
