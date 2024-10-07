//
//  ContentView.swift
//  ControlGroup_Sample
//
//  Created by Siddharth Kothari on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Menu: A control for presenting a menu of actions
        Menu {
            // use ControlGroup to visually group related controls, creating a more compact and organized interface
            ControlGroup {
                Button(action: {}, label: {
                    Image(systemName: "backward.end.fill")})
                
                Button(action: {}, label: {
                    Image(systemName: "play.fill")})
                
                Button(action: {}, label: {
                    Image(systemName: "forward.end.fill")})
            }
            
            Button(action: {}, label: {
                    Label("Fav", systemImage: "heart")
            })
            
            Button(action: {}, label: {
                Label("Lib", systemImage: "line.3.horizontal")
            })
        } label: {
            Image(systemName: "ellipsis.circle")
        }
        .menuOrder(.priority)
    }
}

#Preview {
    ContentView()
}
