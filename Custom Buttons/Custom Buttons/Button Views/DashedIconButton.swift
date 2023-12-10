//
//  DashedIconButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct DashedIconButton: View {
    var body: some View {
        Button {
            print("DashedIconButton pressed")
        } label: {
            Image(systemName: "house.fill")
                .frame(maxWidth: Constants.customHeight, minHeight: Constants.customHeight)
                .overlay {
                    RoundedRectangle(cornerRadius: Constants.customCornerRadius)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [8]))
                }
        }
    }
}

#Preview {
    DashedIconButton()
}
