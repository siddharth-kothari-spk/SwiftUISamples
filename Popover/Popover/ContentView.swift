//
//  ContentView.swift
//  Popover
//
//  Created by Siddharth Kothari on 18/02/24.
//

import SwiftUI
import Popovers

// courtsey: https://betterprogramming.pub/how-to-add-custom-popovers-to-your-swiftui-ios-app-814bdfad73d0

struct ContentView: View {
    @State var basicPopoverPresent1: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Present popover") {
                    basicPopoverPresent1 = true
                }
                .popover(present: $basicPopoverPresent1) {
                    Text("Hi, I'm a popover.")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.blue)
                                    .cornerRadius(16)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
