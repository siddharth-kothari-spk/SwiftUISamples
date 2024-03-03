//
//  ButtonsModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 03/03/24.
//

import SwiftUI

struct ButtonsModule: View {
    @State private var rectColor = Color.blue
    @State private var title = "test"
    @State private var counter = 0
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 200, height: 100)
                .clipShape(Circle())
                .foregroundStyle(rectColor)
                .background(.red)
            Text(title)
                .font(.title)
            
            Button("Change color") {
                rectColor = .green
                title = "Default button"
            }
            .padding()
            
            
            Text("Counter: \(counter)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.cyan)
                .padding()
            
            Button(action: {
                counter += 1
                title = "Custom button"
                rectColor = .purple
            }, label: {
                Text("Custom Button")
                    .font(.headline)
                    .frame(width: 300, height: 50)
                    .background(.purple)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)
                
            })
            
            
            Button(action: {
                title = "Image button"
                rectColor = .cyan
            }, label: {
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.cyan)
            })
        }
    }
}

#Preview {
    ButtonsModule()
}
