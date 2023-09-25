//
//  ContentView.swift
//  Polling Sample
//
//  Created by Siddharth Kothari on 25/09/23.
//
// courtsey : https://medium.com/@abdulkarimkhaan/implementing-polling-in-swiftui-63b77b1cf1f6

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
