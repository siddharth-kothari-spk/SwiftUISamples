//
//  IconButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct IconButton: View {
    var body: some View {
        Button {
            print("IconButton pressed")
        } label: {
            Image(systemName: "house.fill")
                .foregroundStyle(.white)
                .frame(width: Constants.customHeight, height: Constants.customHeight)
                .background(.black)
                .cornerRadius(Constants.customCornerRadius * 0.5)
        }
    }
}

#Preview {
    IconButton()
}
