//
//  MultipleNavigationDestination.swift
//  NavigationStack2
//
//  Created by Siddharth Kothari on 09/03/24.
//

import SwiftUI

struct MultipleNavigationDestination: View {
    private var bgColors: [Color] = [.red, .green, .blue, .yellow, .purple, .black, .orange, .pink, .cyan]
    private var systemImages: [String] = [ "trash", "cloud", "bolt" ]
    var body: some View {
        NavigationStack {
            List(bgColors, id: \.self) { bgColor in
                NavigationLink(value: bgColor) {
                    Text(bgColor.description)
                }
            }
            
            List(systemImages, id:\.self) { systemImage in
                NavigationLink(value: systemImage) {
                    Image(systemName: systemImage)
                        .font(.system(size: 40))
                        .foregroundStyle(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                
            }
            .navigationDestination(for: Color.self) { color in
                color
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
            }
            .navigationDestination(for: String.self) { image in
                Image(systemName: image)
                    .font(.system(size: 100))
                    .foregroundStyle(.cyan)
            }
            .navigationTitle("Navigate")
        }
    }
}

#Preview {
    MultipleNavigationDestination()
}
