//
//  ContentView.swift
//  CheckOrientation
//
//  Created by Siddharth Kothari on 13/03/24.
//

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation

import SwiftUI

struct ContentView: View {
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        Group {
            if orientation.isPortrait {
                    Text("Portrait")
                } else if orientation.isLandscape {
                    Text("Landscape")
                } else if orientation.isFlat {
                    Text("Flat")
                } else {
                    Text("Unknown")
                }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

#Preview {
    ContentView()
}
