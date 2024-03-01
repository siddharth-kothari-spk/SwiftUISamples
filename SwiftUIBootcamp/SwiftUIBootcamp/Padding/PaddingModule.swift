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
        }
    }
}

#Preview {
    PaddingModule()
}
