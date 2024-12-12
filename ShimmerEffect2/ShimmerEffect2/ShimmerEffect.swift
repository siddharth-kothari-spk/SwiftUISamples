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
        /// layout: This parameter provides information about the layout of the text, such as the positions and sizes of individual glyphs.
        /// ctx: This parameter represents the graphics context where the text will be drawn.
        
        /// Method creates a shimmering effect. It does this by dynamically adjusting the opacity of each glyph within the text based on its position and the current animation progress. This results in a visual effect where the text appears to be shimmering or highlighting as the animation progresses.
        for line in layout {
            for runs in line {
                for (index, glyph) in runs.enumerated() {
                    let relativePosition = CGFloat(index) / CGFloat(runs.count) // This variable calculates the relative position of the current glyph within its run.
                    let adjustedOpacity = max(0, 1 - abs(relativePosition - animationInProgress)) // This ensures that the opacity smoothly transitions from 0 to 1 and back to 0 as the animation progresses.
                    ctx.opacity = adjustedOpacity
                    ctx.draw(glyph)
                }
            }
        }
    }
    
    
}
