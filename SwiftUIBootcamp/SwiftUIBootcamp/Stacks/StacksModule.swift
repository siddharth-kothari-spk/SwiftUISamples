//
//  StacksModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 28/02/24.
//

import SwiftUI

struct StacksModule: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 100)
                .clipShape(Circle(), style: FillStyle(eoFill: true))
            
            Capsule(style: .continuous)
                .fill(.green)
                .frame(width: 200,height: 50)
            
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 100)
                .clipShape(Circle(), style: FillStyle(antialiased: false))
            
            
            Spacer()
            
            HStack {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 100)
                    .clipShape(Circle(), style: FillStyle(eoFill: true))
                
                Capsule(style: .continuous)
                    .fill(.green)
                    .frame(width: 50,height: 200)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 100)
                    .clipShape(Circle(), style: FillStyle(antialiased: false))
            }.padding()
            
            Spacer()
            
            ZStack(content: {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle(), style: FillStyle(eoFill: true))
                
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle(), style: FillStyle(eoFill: true))
                
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle(), style: FillStyle(eoFill: true))
            })
        }
    }
}

#Preview {
    StacksModule()
}
