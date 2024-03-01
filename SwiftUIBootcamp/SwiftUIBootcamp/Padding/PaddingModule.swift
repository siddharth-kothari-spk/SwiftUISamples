//
//  PaddingModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 29/02/24.
//

import SwiftUI

struct PaddingModule: View {
    var body: some View {
        VStack {
            Text("padding before color")
                .padding()
                .background(.blue)
            
            Text("padding after color")
                .background(.pink)
                .padding()
            
            Text("Horizontal padding")
                .padding(.horizontal, 20)
                .background(.green)
            
            Text("Vertical padding")
                .padding(.vertical, 20)
                .background(.brown)
            
            Text("both horizontal and vertical")
                .padding(15)
                .background(.red)
            
            Text("leading")
                .padding(.leading, 15)
                .background(.yellow)
            
            Text("trailing")
                .padding(.trailing, 15)
                .background(.yellow)
            
            Text("top")
                .padding(.top, 15)
                .background(.yellow)
            
            Text("bottom")
                .padding(.bottom, 15)
                .background(.yellow)
        }
    }
}

#Preview {
    PaddingModule()
}
