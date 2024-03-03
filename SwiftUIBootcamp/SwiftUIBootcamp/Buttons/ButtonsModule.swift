//
//  ButtonsModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 03/03/24.
//

import SwiftUI

struct ButtonsModule: View {
    @State private var rectColor = Color.blue
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
        }
    }
}

#Preview {
    ButtonsModule()
}
