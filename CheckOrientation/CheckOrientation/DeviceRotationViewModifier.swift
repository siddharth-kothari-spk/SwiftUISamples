//
//  DeviceRotationViewModifier.swift
//  CheckOrientation
//
//  Created by Siddharth Kothari on 13/03/24.
//

import SwiftUI

// Our custom view modifier to track rotation and call our action
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification), perform: { _ in
                action(UIDevice.current.orientation)
            })
    }
}

