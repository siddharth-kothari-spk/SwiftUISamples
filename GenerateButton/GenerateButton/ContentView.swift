//
//  ContentView.swift
//  GenerateButton
//
//  Created by Siddharth Kothari on 18/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-swift-iosdeveloper-activity-7263896723029204992-G8RH/?utm_source=share&utm_medium=member_ios

import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
        }
        .onTapGesture(perform: {
            withAnimation {
                show.toggle()
            }
        })
    }
}

#Preview {
    ContentView()
}
