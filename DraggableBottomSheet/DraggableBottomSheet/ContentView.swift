//
//  ContentView.swift
//  DraggableBottomSheet
//
//  Created by Siddharth Kothari on 29/03/24.
//

import SwiftUI
import MapKit
// courtsey: https://tanaschita.com/20240311-draggable-sheet-with-scroll-view/
struct ContentView: View {
    @State private var showingBottomSheet = true
    
    var body: some View {
        Map().frame(alignment: .center)
        // We create a sheet with a state variable showingBottomSheet set to true
            .sheet(isPresented: $showingBottomSheet, content: {
                ScrollView {
                    Text("Draggable Bottom Sheet")
                }
                // We use .interactiveDismissDisabled() to disable dismissal of the sheet by swiping it down
                .interactiveDismissDisabled()
                // We use .presentationDetents([.height(50), .medium, .large]) to setup the different states of the sheet when user drags it down and up
                .presentationDetents([.height(50), .medium, .large])
                // We use .presentationBackgroundInteraction() to allow user interaction with the parent view when the sheet is not fully opened.
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
            })
    }
}

#Preview {
    ContentView()
}
