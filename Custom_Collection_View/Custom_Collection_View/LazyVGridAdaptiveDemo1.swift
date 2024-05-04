//
//  LazyVGridAdaptiveDemo1.swift
//  Custom_Collection_View
//
//  Created by Siddharth Kothari on 04/05/24.
//

import SwiftUI

struct LazyVGridAdaptiveDemo1: View {
    var body: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 80, maximum: 200))],
            alignment: .center) {
                ForEach(0..<7) {index in
                    Text("item \(index)")
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .lineLimit(1)
                        .background(RoundedRectangle(cornerRadius: 16))
                }
            }
            .padding(.all, 50)
            .background(Color(UIColor.lightGray))
            
    }
}

#Preview {
    LazyVGridAdaptiveDemo1()
}
