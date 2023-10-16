//
//  ContentView.swift
//  ThreadsUI
//
//  Created by Siddharth Kothari on 16/10/23.
//

// courtsey: https://www.swiftjectivec.com/meta-threads-ios-interface-in-swiftui/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
