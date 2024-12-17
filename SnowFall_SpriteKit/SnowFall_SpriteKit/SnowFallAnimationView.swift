//
//  SnowFallAnimationView.swift
//  SnowFall_SpriteKit
//
//  Created by Siddharth Kothari on 17/12/24.
//

import Foundation
import SpriteKit
import SwiftUI

struct SnowFallAnimationView: View {
    var body: some View {
        GeometryReader { geometryProxy in
            SpriteView(scene: SnowFall(), options: [.allowsTransparency])
        }
        .background {
            Color(.darkGray)
        }
        .ignoresSafeArea()
    }
}
