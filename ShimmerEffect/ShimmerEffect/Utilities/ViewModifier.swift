//
//  ViewModifier.swift
//  ShimmerEffect
//
//  Created by Siddharth Kothari on 05/02/24.
//

import Foundation
import SwiftUI

public struct Shimmer: ViewModifier {
    
    @State private var isInitialState = true
    
    public func body(content: Content) -> some View {
        content.mask {
            LinearGradient(gradient: .init(colors: [.black.opacity(0.4), .black, .black.opacity(0.4)]),
                           startPoint: isInitialState ? .init(x: -0.3, y: -0.3) : .init(x: 1, y: 1),
                           endPoint: isInitialState ? .init(x: 0, y: 0) : .init(x: 1.3, y: 1.3)
            )
        }.animation(.linear(duration: 1.5).delay(0.25).repeatForever(autoreverses: false), value: isInitialState)
            .onAppear(perform: {
                isInitialState = false
            })
    }
    
}
