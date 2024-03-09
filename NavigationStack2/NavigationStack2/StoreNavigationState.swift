//
//  StoreNavigationState.swift
//  NavigationStack2
//
//  Created by Siddharth Kothari on 09/03/24.
//

import SwiftUI

struct StoreNavigationState: View {
    private var bgColors: [Color] = [ .indigo, .yellow, .green, .orange, .brown ]
 
    @State private var path: [Color] = []
 
    var body: some View {
 
        NavigationStack(path: $path) {
            List(bgColors, id: \.self) { bgColor in
 
                NavigationLink(value: bgColor) {
                    Text(bgColor.description)
                }
 
            }
            .listStyle(.plain)
 
            .navigationDestination(for: Color.self) { color in
                VStack {
                    Text("\(path.count), \(path.description)")
                        .font(.headline)
 
                    HStack {
                        ForEach(path, id: \.self) { color in
                            color
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
 
                    }
 
                    List(bgColors, id: \.self) { bgColor in
 
                        NavigationLink(value: bgColor) {
                            Text(bgColor.description)
                        }
 
                    }
                    .listStyle(.plain)
 
                    Button {
                        path = .init()
                        // By resetting the value of the path variable, we can instruct the navigation stack to go back to the root level.
                    } label: {
                        Text("Back to Main")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
            }
 
            .navigationTitle("Color")
 
        }
 
    }
}

#Preview {
    StoreNavigationState()
}
