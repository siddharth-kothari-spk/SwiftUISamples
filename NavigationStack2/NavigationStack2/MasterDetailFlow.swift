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
        // We still use NavigationLinks to present the list of data and implement the navigation feature. What’s difference is that each NavigationLink associates with a value. On top of that, we added the new navigationDestination modifier to capture the value change. When a user selects a particular link, the navigationDestination modifier presents the corresponding destination view for navigation links that present data of type Color.
    }
}

#Preview {
    MasterDetailFlow()
}
