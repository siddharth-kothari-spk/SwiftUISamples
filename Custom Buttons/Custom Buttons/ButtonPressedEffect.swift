//
//  ButtonPressedEffect.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import Foundation
import SwiftUI

struct ButtonPressedEffect: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .secondary : .primary)
            .background(configuration.isPressed ? .secondary : .primary)
            .animation(.easeInOut, value: configuration.isPressed)
            .cornerRadius(15)
    }
}
