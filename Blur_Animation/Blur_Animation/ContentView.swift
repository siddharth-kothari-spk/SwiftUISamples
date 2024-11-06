//
//  ContentView.swift
//  Blur_Animation
//
//  Created by Siddharth Kothari on 06/11/24.
//
// https://www.linkedin.com/feed/update/urn:li:activity:7259523711345524737/

import SwiftUI

struct ContentView: View {
    let text = "Swift Language"
    @State var isVisible = false
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(text.enumerated()), id: \.offset) { index, alphabet in
                
                Text(String(alphabet))
                    .font(.largeTitle.bold())
                    .animation(
                        .easeOut(duration: 0.3)
                        .delay(Double(index) * 0.1), value: isVisible)
            }
        }
        .onAppear {
            isVisible = true
        }
    }
}

#Preview {
    ContentView()
}
