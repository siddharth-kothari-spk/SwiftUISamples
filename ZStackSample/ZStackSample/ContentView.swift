//
//  ContentView.swift
//  ZStackSample
//
//  Created by Siddharth Kothari on 19/02/24.
//

//courtsey: https://medium.com/@jakir/splashscreen-in-swiftui-application-3918c7dd88ee

import SwiftUI

struct ContentView: View {
    @State var showSplash: Bool = false
    
    var body: some View {
        ZStack {
            if self.showSplash {
                Color.green.ignoresSafeArea()
                Text("Hello world")
            }
            else {
                Color.teal.ignoresSafeArea()
                ProgressView()
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3.0, execute: DispatchWorkItem(block: {
                self.showSplash = true
            }))
        })
    }
}

#Preview {
    ContentView()
}
