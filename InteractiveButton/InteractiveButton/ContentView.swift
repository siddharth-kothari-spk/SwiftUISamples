//
//  ContentView.swift
//  InteractiveButton
//
//  Created by Siddharth Kothari on 04/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var colorChange = false
    @State private var sizeChange = false
    
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 400))
            .foregroundColor(colorChange ? .yellow : .red)
            .scaleEffect(sizeChange ? 1.5 : 1)
            .animation(.default, value: 1)
            .onTapGesture {
                self.colorChange.toggle()
            }
            .onLongPressGesture {
                self.sizeChange.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
