//
//  ViewExtension.swift
//  CheckOrientation
//
//  Created by Siddharth Kothari on 13/03/24.
//

import SwiftUI

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
