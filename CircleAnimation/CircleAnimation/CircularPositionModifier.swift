//
//  CircularPositionModifier.swift
//  CircleAnimation
//
//  Created by Siddharth Kothari on 24/11/24.
//

import Foundation
import SwiftUI

struct CircularPositionModifier: ViewModifier {
    
    var index: Int
    var totalCount: Int
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        let angle = Angle(degrees: (Double(index) /  Double(totalCount)) * 360)
        return content
            .offset(
                x: CGFloat(cos(angle.radians)) * radius,
                y: CGFloat(sin(angle.radians)) * radius
            )
    }
}

extension View {
    func circularPosition(index: Int, totalCount: Int, radius: CGFloat) -> some View {
        self.modifier(CircularPositionModifier(index: index, totalCount: totalCount, radius: radius))
    }
}
