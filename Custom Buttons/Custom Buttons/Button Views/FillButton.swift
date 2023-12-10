//
//  FillButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct FillButton: View {
    var body: some View {
        Button(action: {
            print("FillButton pressed")
        }, label: {
            Text("Fill Button")
                .foregroundStyle(.white)
                .font(.system(size: Constants.customFontSize, weight: Constants.customFontWeight, design: Constants.customFontDesign))
                .frame(maxWidth: .infinity, minHeight: Constants.customHeight)
                .background(.black)
                .cornerRadius(Constants.customCornerRadius)
        })
    }
}

#Preview {
    FillButton()
}
