//
//  ContentView.swift
//  Published usage sample
//
//  Created by Siddharth Kothari on 29/09/23.
//

// https://medium.com/swiftly-engineered-ios/how-to-use-published-in-swiftui-6c796831ee51

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
