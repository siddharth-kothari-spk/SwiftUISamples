//
//  StackCustom3.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 29/02/24.
//

import SwiftUI

struct StackCustom3: View {
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading ,content: {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 50, height: 50)
            })
            
            ZStack(alignment: .topTrailing ,content: {
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
            
            ZStack(alignment: .bottomLeading ,content: {
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
            
            ZStack(alignment: .bottomTrailing ,content: {
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
    StackCustom3()
}
