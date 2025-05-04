//
//  ContentView.swift
//  TernaryView
//
//  Created by Siddharth Kothari on 04/05/25.
//

// courtsey: https://www.linkedin.com/posts/su-codee-676946321_100sswiftui-activity-7323685313174786048-Ui86?utm_source=share&utm_medium=member_desktop&rcm=ACoAAANKgeABRYhGDBPe_zPH-v22kh4SYCyDY2Q

import SwiftUI

struct ContentView: View {
    @State var big = false
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(big ? .large : .small)
                .foregroundStyle(.tint)
            
            Text("Hello, world!")
                .fontDesign(big ? .monospaced : .rounded)
            
            Button {
                withAnimation {
                    big.toggle()
                }
            } label: {
                Text(big ? "Make small" : "Make big")
                    .font(big ? .subheadline.italic() : .largeTitle.italic())
                    .fontWeight(big ? .bold : .heavy)
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
