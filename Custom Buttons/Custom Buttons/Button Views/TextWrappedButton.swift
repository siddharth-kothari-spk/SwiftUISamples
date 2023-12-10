//
//  TextWrappedButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct TextWrappedButton: View{
    var body: some View {
        Button{
            print("TextWrappedButton pressed")
        } label: {
            Text("Text Wrapped Button")
                .foregroundColor(.white)
                .font(.system(size: Constants.customFontSize, weight: Constants.customFontWeight))
                .padding(.horizontal, Constants.customPadding)
                .padding(.vertical, Constants.customPadding)
                .background(.black)
                .cornerRadius(Constants.customCornerRadius)
        }
    }
}

#Preview {
    TextWrappedButton()
}
