//
//  ContentView.swift
//  GlowText
//
//  Created by Siddharth Kothari on 17/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-iosdeveloper-activity-7263509772019077121-2gR_/

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var color: [Color] = [.indigo, .green, .yellow, .orange, .red]
    var title: [String] = ["Indigo", "Green", "Yellow", "Orange", "Red"]
    
    var body: some View {
        Text(title[index])
            .font(.system(.largeTitle, design: .monospaced))
            .contentTransition(.numericText())
            .shadow(color: color[index], radius: 5)
            .shadow(color: color[index], radius: 25)
            .shadow(color: color[index], radius: 50)
            .shadow(color: color[index], radius: 100)
            .shadow(color: color[index], radius: 150)
            .shadow(color: color[index], radius: 200)
            .onAppear(perform: {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    withAnimation {
                        index = (index + 1) % color.count
                    }
                }
            })
    }
}

#Preview {
    ContentView()
}
