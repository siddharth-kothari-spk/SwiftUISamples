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
            NavigationView {
                HStack {
                    Image(systemName: "globe")
                        .fontWeight(.semibold)
                    Spacer()
                    Text("Threads UI")
                    Spacer()
                    Image(systemName: "plus.circle")
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 32)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
