//
//  ContentView.swift
//  SwiftUI_Mask
//
//  Created by Siddharth Kothari on 10/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-iosdeveloper-activity-7261328524307759104-HPSe?utm_source=share&utm_medium=member_desktop

import SwiftUI

struct ContentView: View {
    let gradientColors: [Color] = [.red, .orange, .blue, .yellow, .green, .purple, .pink]
    @State var degrees: Double = 0
    
    var body: some View {
        ZStack(content: {
            Circle()
                .frame(width: 150, height: 150)
        })
    }
}

#Preview {
    ContentView()
}
