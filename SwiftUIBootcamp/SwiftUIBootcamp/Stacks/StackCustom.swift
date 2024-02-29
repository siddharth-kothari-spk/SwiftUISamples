//
//  StackCustom.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 29/02/24.
//

import SwiftUI

struct StackCustom: View {
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("15 spacing between contents").fontWeight(.medium).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            VStack(spacing: 15, content: { // 15 spacing between contents
                Capsule(style: .continuous)
                    .fill(.green)
                    .frame(width: 200,height: 50)
                
                Capsule(style: .continuous)
                    .fill(.red)
                    .frame(width: 200,height: 50)
            })
            
            Text("overlap due to -15 spacing").fontWeight(.medium).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            VStack(spacing: -15, content: { // overlap due to -ve spacing
                Capsule(style: .continuous)
                    .fill(.green)
                    .frame(width: 200,height: 50)
                
                Capsule(style: .continuous)
                    .fill(.red)
                    .frame(width: 200,height: 50)
            })
            
            Text("0 spacing").fontWeight(.medium).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            VStack(spacing: 0, content: { // 0 spacing
                Capsule(style: .continuous)
                    .fill(.green)
                    .frame(width: 200,height: 50)
                
                Capsule(style: .continuous)
                    .fill(.red)
                    .frame(width: 200,height: 50)
            })
            
            Text("default spacing").fontWeight(.medium).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            VStack { // default spacing
                Capsule(style: .continuous)
                    .fill(.green)
                    .frame(width: 200,height: 50)
                
                Capsule(style: .continuous)
                    .fill(.red)
                    .frame(width: 200,height: 50)
            }
        })
        // same we can do with HStack
    }
}

#Preview {
    StackCustom()
}
