//
//  ButtonWithCustomEffect.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct ButtonWithCustomEffect: View{
    var body: some View {
        Button{
            print("ButtonWithCustomEffect pressed")
        } label: {
            Text("Custom Pressed Effect")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, minHeight: 52)
        }
        .buttonStyle(ButtonPressedEffect())
    }
}

#Preview {
    ButtonWithCustomEffect()
}
