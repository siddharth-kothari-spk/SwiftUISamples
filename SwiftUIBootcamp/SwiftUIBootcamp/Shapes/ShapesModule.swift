//
//  ShapesModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 28/02/24.
//

import SwiftUI

struct ShapesModule: View {
    var body: some View {
        VStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [5.0,15.0],dashPhase: 10.0))
                .fill(.yellow)
                .frame(width: 200, height: 200, alignment: .center)
            .padding()
            
            Rectangle()
                .fill(.brown)
                .frame(width: 200, height: 150)
                .cornerRadius(10)
                .padding()
            
            Capsule(style: .continuous)
                .frame(width: 200, height: 50)
                .padding()
        }
    }
}

#Preview {
    ShapesModule()
}
