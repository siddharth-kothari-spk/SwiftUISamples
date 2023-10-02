//
//  ContentTransitionView.swift
//  SF Symbols animation
//
//  Created by Siddharth Kothari on 02/10/23.
//

import SwiftUI

struct ContentTransitionView: View {
    @State private var muteOn = false
    private var buttonTitle: String {
        return muteOn ? "Unmute" : "Mute"
    }
    
    var body: some View {
        VStack {
            Button {
                muteOn.toggle()
            } label: {
                Label(buttonTitle, systemImage: !muteOn ? "speaker.wave.3.fill" : "speaker.slash.fill")
            }
            .contentTransition(.symbolEffect(.replace))
        }
        .font(.largeTitle)
    }
}

#Preview {
    ContentTransitionView()
}
