//
//  ContentView.swift
//  GroupBox
//
//  Created by Siddharth Kothari on 08/11/24.
//
// courtsey: sucodee https://www.linkedin.com/posts/su-codee-676946321_swiftui-groupbox-activity-7256261786989940736-hnTB?utm_source=share&utm_medium=member_desktop

import SwiftUI

struct ContentView: View {
    var body: some View {
        GroupBox {
            Text("GroupBox sample demo text ")
                .background(.thickMaterial, in: Capsule())
                .padding(20)
        } label: {
            
            HStack {
                Image(systemName: "trophy.fill")
                    .font(.title)
                    .foregroundStyle(.red)
                    .padding()
                    .background(.thinMaterial, in: Circle())
                
                Text("Demo title")
                    .font(.title)
                    .background(in: Capsule(style: .continuous), fillStyle: FillStyle(eoFill: true))
            }
        }

    }
}

#Preview {
    ContentView()
}
