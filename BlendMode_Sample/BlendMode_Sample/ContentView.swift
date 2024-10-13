//
//  ContentView.swift
//  BlendMode_Sample
//
//  Created by Siddharth Kothari on 13/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Normal")
                    Color.yellow.frame(width: 50, height: 50, alignment: .center)
           
                    Color.red.frame(width: 50, height: 50, alignment: .center)
                        .rotationEffect(.degrees(45))
                        .padding(-20)
                        .blendMode(.normal)
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
