//
//  Bubble.swift
//  Bubble_Animation
//
//  Created by Siddharth Kothari on 13/11/24.
//

import Foundation

struct Bubble: Identifiable {
    let id = UUID()
    var size: CGFloat
    var positionX: CGFloat
    var positionY: CGFloat
    var speed: Double
    var opacity: Double
}
