//
//  ContentView.swift
//  LoadingAnimation
//
//  Created by Siddharth Kothari on 01/09/24.
//

// courtsey: https://x.com/sucodeee/status/1819715043241410982

import SwiftUI

struct ContentView: View {
    @State var currentIndex = 0
    let colours: [Color] = [.orange, .blue, .red, .cyan, .yellow, .green]
    var body: some View {
        HStack(spacing: 6, content: {
            ForEach(colours, id: \.self) { colour in
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(colour)
                    .frame(width: 5, height: 100)
            }
        })
    }
}

#Preview {
    ContentView()
}
