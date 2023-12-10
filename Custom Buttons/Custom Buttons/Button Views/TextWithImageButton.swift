//
//  TextWithImageButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct TextWithImageButton: View{
    var body: some View {
        Button{
            print("TextWithImageButton pressed")
        } label: {
            HStack {
                Image(systemName: "house.fill")
                Text("Button With Icon")
            }
            .foregroundStyle(.white)
            .font(.system(size: Constants.customFontSize, weight: Constants.customFontWeight, design: Constants.customFontDesign))
            .frame(maxWidth: .infinity, minHeight: Constants.customHeight)
            .background(.black)
            .cornerRadius(Constants.customCornerRadius)
            
        }
    }
}

#Preview {
    TextWithImageButton()
}
