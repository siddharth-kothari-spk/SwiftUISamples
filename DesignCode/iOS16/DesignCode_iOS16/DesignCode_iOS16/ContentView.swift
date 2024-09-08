//
//  ContentView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 17/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var showMessage = false
    @State var selectedItem: Menu = .trash
    var body: some View {
        
        VStack {
            Text("Parent view")
            ZStack {
                switch selectedItem {
                case .trash:
                    MessageView()
                case .pencil:
                    Text("pencil")
                case .eraser:
                    Text("eraser")
                case .lasso:
                    Text("lasso")
                case .folder:
                    Text("folder")
                }
            }
            Button("Show message") {
                showMessage = true
            }
            .sheet(isPresented: $showMessage, content: {
                MenuView(selectedItem: $selectedItem)
                    .presentationDetents([.medium, .large])
            })
        }
    }
}

#Preview {
    ContentView()
}


// Glossary
// A. vibrancy refers to how our text seems to be of different color based on background. For this we keep foreground style as secondary and now based on background image (Material enum) it changes appearance
