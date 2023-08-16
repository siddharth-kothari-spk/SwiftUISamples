//
//  ContentView.swift
//  Health Kit Sample
//
//  Created by Siddharth Kothari on 16/08/23.
//

// courtsey: https://betterprogramming.pub/get-step-count-data-from-healthkit-b6d1a2818e73

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
