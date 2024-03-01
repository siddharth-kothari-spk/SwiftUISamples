//
//  SpacersModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 01/03/24.
//

import SwiftUI

struct SpacersModule: View {
    var body: some View {
        VStack {
            Spacer() // Spacer fill all the space vertically by default
                .frame(width: 50)
            .background(.red)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Spacer()
                .frame(width: 50)
                .background(.red)
        }
    }
}

#Preview {
    SpacersModule()
}
