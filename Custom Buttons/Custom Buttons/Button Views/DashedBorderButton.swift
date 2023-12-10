//
//  DashedBorderButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct DashedBorderButton: View {
    var body: some View {
        Button{
            print("DashedBorderButton pressed")
        } label: {
            Text("Dashed Border Button")
                .font(.system(size: Constants.customFontSize, weight: Constants.customFontWeight))
                .frame(maxWidth: .infinity, minHeight: Constants.customHeight)
                .overlay {
                    RoundedRectangle(cornerRadius: Constants.customCornerRadius)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [10]))

                }
        }
    }
}

#Preview {
    DashedBorderButton()
}
