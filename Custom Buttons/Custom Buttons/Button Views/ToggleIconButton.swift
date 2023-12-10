//
//  ToggleIconButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct ToggleIconButton: View {
    @State var isActive = false
    var body: some View {
        Image(systemName: "house.fill")
            .frame(width: Constants.customHeight, height: Constants.customHeight)
            .foregroundColor(isActive ? .white : .black)
            .background(isActive ? .black : .clear)
            .cornerRadius(Constants.customCornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: Constants.customCornerRadius)
                    .stroke(Color.black)
            }
            .onTapGesture {
                withAnimation {
                    isActive.toggle()
                }
                // With the onTapGesture modifier, we don't get any tab visual behavior but with Button when we press the button the the opacity of that button changes
            }
    }
}

#Preview {
    ToggleIconButton()
}
