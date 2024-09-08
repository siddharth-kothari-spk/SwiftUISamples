//
//  ContentView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 17/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var showMessage = false
    
    var body: some View {
        Text("Parent view")
        Button("Show message") {
            showMessage = true
        }
        .sheet(isPresented: $showMessage, content: {
            NavigationStackView()
                .presentationDetents([.medium, .large, .fraction(0.33), .height(600.0)])
        })
    }
}

#Preview {
    ContentView()
}


// Glossary
// A. vibrancy refers to how our text seems to be of different color based on background. For this we keep foreground style as secondary and now based on background image (Material enum) it changes appearance
