//
//  RadioButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct RadioButton: View {
    @State var isActive = false
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(.black.opacity(isActive ? 1 : 0))
                .frame(width: Constants.customHeight * 0.33, height: Constants.customHeight * 0.33)
                .cornerRadius(Constants.customCornerRadius)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 2)
                        .frame(width: 20, height: 20)
                }
            
            Text("Radio Button ")
        }
        .onTapGesture {
            print("RadioButton pressed")
            withAnimation {
                isActive.toggle()
            }
        }
    }
}

#Preview {
    RadioButton()
}
