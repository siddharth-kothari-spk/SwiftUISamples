//
//  ShimmerEffect.swift
//  ShimmerEffect2
//
//  Created by Siddharth Kothari on 11/12/24.
//

import Foundation
import SwiftUI

// TextRenderer : available from iOS 17 onwards
struct ShimmerEffect: TextRenderer {
    var animationInProgress: CGFloat
    //var animatableData: EmptyAnimatableData
    var animateData: Double {
        get { animationInProgress}
        set { animationInProgress = newValue}
    }
    // avaialble from iOS 17 onwards , 2 more methods came from iOS 18
    func draw(layout: Text.Layout, in ctx: inout GraphicsContext) {
        for line in layout {
            for runs in line {
                for (index, glyph) in runs.enumerated() {
                    let relativePosition = CGFloat(index) / CGFloat(runs.count)
                    let adjustedOpacity = max(0, 1 - abs(relativePosition - animationInProgress))
                    ctx.opacity = adjustedOpacity
                    ctx.draw(glyph)
                }
            }
        }
    }
    
    
}
