//
//  BorderButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct BorderButton: View{
    var body: some View {
        Button{
            print("BorderButton pressed")
        } label: {
            Text("Border Button")
                .foregroundStyle(.black)
                .font(.system(size: Constants.customFontSize, weight: Constants.customFontWeight, design: Constants.customFontDesign))
                .frame(maxWidth: .infinity, minHeight: Constants.customHeight)
                .cornerRadius(Constants.customCornerRadius)
                .overlay {
                    RoundedRectangle(cornerRadius: Constants.customCornerRadius)
                        .stroke(Color.black)
                }
        }
    }
}

#Preview {
    BorderButton()
}
