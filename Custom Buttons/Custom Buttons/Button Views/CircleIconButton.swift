//
//  CircleIconButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct CircleIconButton: View {
    var body: some View {
        Button {
            print("CircleIconButton pressed")
        } label: {
            Image(systemName: "house.fill")
                .frame(width: Constants.customHeight, height: Constants.customHeight)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(Constants.customCornerRadius)
        }
    }
}

#Preview {
    CircleIconButton()
}
