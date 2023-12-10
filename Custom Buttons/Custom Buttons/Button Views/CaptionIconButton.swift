//
//  CaptionIconButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct CaptionIconButton: View {
    var body: some View {
        Button {
            print("CaptionIconButton pressed")
        } label: {
            VStack(spacing: 2) {
                Image(systemName: "house.fill")
                    .frame(width: Constants.customHeight, height: Constants.customHeight)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(Constants.customCornerRadius)
                Text("Caption Button")
                    .font(.system(size: Constants.customFontSize, weight: Constants.customFontWeight))
                    .frame(width: Constants.customTextWidth) // Here we are giving the static width to the Text and using that if we add more text then text will wrap into the new line.
            }
        }
    }
}

#Preview {
    CaptionIconButton()
}
