//
//  SnowFall.swift
//  SnowFall_SpriteKit
//
//  Created by Siddharth Kothari on 17/12/24.
//

import Foundation
import SpriteKit

// A scene is the root node of your content. It is used to display SpriteKit content on an SKView

class SnowFall: SKScene {
    /* This method is called once after the scene has been initialized or decoded,
     this is the recommended place to perform one-time setup */
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill //  Used to determine how to scale the scene to match the SKView it is being displayed in.
        anchorPoint = CGPoint(x: 0.5, y: 0.5) // Used to choose the origin of the scene's coordinate system
        backgroundColor = .clear
        
    }
}
