//
//  ContentView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 17/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var showMessage = false
    @AppStorage("selectedItem") var selectedItem: Menu = .trash
    @GestureState var press = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($press) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded { value in
                showMessage = true
            }
    }
    var body: some View {
        
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            switch selectedItem {
            case .trash:
                MessageView()
            case .pencil:
                DetailView()
            case .eraser:
                CardReflectionView()
            case .lasso:
                CardView()
            case .folder:
                Text("folder")
            }
        }
        .onTapGesture {
         // empty tapgesture to use scroll view when we have long press gesture
        }
        .gesture(longPress)
        .sheet(isPresented: $showMessage, content: {
            MenuView()
                .presentationDetents([.medium, .large])
        })
        
    }
}

#Preview {
    ContentView()
}


// Glossary
// A. vibrancy refers to how our text seems to be of different color based on background. For this we keep foreground style as secondary and now based on background image (Material enum) it changes appearance
