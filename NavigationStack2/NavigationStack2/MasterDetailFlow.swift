//
//  MasterDetailFlow.swift
//  NavigationStack2
//
//  Created by Siddharth Kothari on 09/03/24.
//

import SwiftUI

struct MasterDetailFlow: View {
  private var bgColors: [Color] = [.red, .green, .blue, .yellow, .purple, .black, .orange, .pink, .cyan]
    
    var body: some View {
        // style 1
        /*
        NavigationStack {
            List(bgColors, id: \.self) { bgColor in
                NavigationLink(bgColor.description) {
                    bgColor
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                }
            }
            .navigationTitle("Color")
            .listStyle(.insetGrouped)
        }
        */
        // style 2
        NavigationStack {
            List(bgColors, id: \.self) { bgColor in
                NavigationLink(value: bgColor) {
                    Text(bgColor.description)
                }
            }
            .navigationDestination(for: Color.self) { color in
                color
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
            }
            .navigationTitle("Color")
        }
    }
}

#Preview {
    MasterDetailFlow()
}
