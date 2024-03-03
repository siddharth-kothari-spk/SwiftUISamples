//
//  ButtonsModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 03/03/24.
//

import SwiftUI

struct ButtonsModule: View {
    @State private var rectColor = Color.blue
    @State private var counter = 0
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 200, height: 100)
                .clipShape(Circle())
                .foregroundStyle(rectColor)
                .background(.red)
            
            Button("Default button :Change color") {
                rectColor = .green
            }
            .padding()
            
            
            Text("Counter: \(counter)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.cyan)
                .padding()
            
            Button(action: {
                counter += 1
            }, label: {
                Text("Custom Button")
                    .font(.headline)
                    .frame(width: 300, height: 50)
                    .background(.red)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)
                
            })
        }
    }
}

#Preview {
    ButtonsModule()
}
