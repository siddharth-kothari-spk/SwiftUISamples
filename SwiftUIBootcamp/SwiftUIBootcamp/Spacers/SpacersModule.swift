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
            Spacer() // Spacer fill all the space vertically in VStack
                .frame(width: 50)
            .background(.red)
            
            Text("Vertical")
            
            Spacer()
                .frame(width: 50)
                .background(.red)
            
            HStack(content: {
                Text("Horizontal")
                Spacer() // Spacer fill all the space horizontally in HStack
                    .frame(height: 25)
                    .background(.cyan)
            })
        }
    }
}

#Preview {
    SpacersModule()
}
