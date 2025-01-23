//
//  ButtonWithCustomStyle.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 23/01/25.
//

import Foundation
import SwiftUI

struct ButtonWithCustomStyle: View {
    
    var body: some View {
        Button {
            print("ButtonWithCustomStyle presses")
        } label: {
            Text("Subscribe")
        }
        .buttonStyle(CustomButtonStyle())
        .padding(.horizontal)
        .scaleEffect(1.8)
        /// Scales this view's rendered output by the given amount in both the horizontal and vertical directions, relative to an anchor point.
    }
}

struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .bold()
            .frame(height: 55)
            .padding(.horizontal, 30)
            .foregroundStyle(.white)
            .background(.indigo.shadow(.inner(color: .black, radius: 5, x: 0, y: configuration.isPressed ? 0 : -2.5)), in: Capsule())
    }
}
