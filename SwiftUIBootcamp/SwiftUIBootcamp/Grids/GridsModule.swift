//
//  GridsModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 02/03/24.
//

import SwiftUI

struct GridsModule: View {
    
    let columns: [GridItem] = [
        .init(.fixed(100)),
        .init(.adaptive(minimum: 25, maximum: 150)),
        .init(.flexible(minimum: 300, maximum: 400))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0...50, id: \.self) { item in
                    Rectangle()
                        .frame(height: 50)
                        .background(.red)
                }
            }
            
            Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 13) {
                ForEach(0...50, id: \.self) { item in
                    Rectangle()
                        .frame(height: 50)
                        .background(.red)
                }
            }
        }
    }
}

#Preview {
    GridsModule()
}
