//
//  IconButtonWithFullWidth.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct IconButtonWithFullWidth: View {
    var body: some View {
        Button {
            print("IconButtonWithFullWidth pressed")
        } label: {
            Image(systemName: "house.fill")
                .frame(maxWidth: .infinity, minHeight: Constants.customHeight)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(Constants.customCornerRadius)
        }
    }
}

#Preview {
    IconButtonWithFullWidth()
}
