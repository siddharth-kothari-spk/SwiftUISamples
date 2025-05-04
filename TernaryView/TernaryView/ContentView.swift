//
//  ContentView.swift
//  TernaryView
//
//  Created by Siddharth Kothari on 04/05/25.
//

// courtsey: https://www.linkedin.com/posts/su-codee-676946321_100sswiftui-activity-7323685313174786048-Ui86?utm_source=share&utm_medium=member_desktop&rcm=ACoAAANKgeABRYhGDBPe_zPH-v22kh4SYCyDY2Q

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button {
                withAnimation {
                    
                }
            } label: {
                Text("Open")
                    .font(.largeTitle.italic())
            }
            .tint(.primary)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
