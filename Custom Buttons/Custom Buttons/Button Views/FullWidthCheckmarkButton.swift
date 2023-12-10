//
//  CheckmarkButton2.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct FullWidthCheckmarkButton: View {
    @State var isActive = false
    var body: some View {
        HStack(spacing: 12) {
            Text("Full Width Checkmark")
                .font(.system(size: Constants.customFontSize, weight: Constants.customFontWeight))
                .foregroundColor(isActive ? .white : .black)
            
            Spacer()
            
            Image(systemName: isActive ? "checkmark.circle.fill" : "")
                .resizable()
                .foregroundColor(isActive ? .white : .black)
                .frame(width: 24, height: 24)
                .overlay {
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(isActive ? .white : .black)
                }
        }
        .padding(.horizontal, 16)
        .frame(height: Constants.customHeight)
        .background(isActive ? .black : .white)
        .cornerRadius(15)
        .overlay {
            RoundedRectangle(cornerRadius: Constants.customCornerRadius)
                .stroke(.black)
        }
        .onTapGesture {
            print("Full Width Checkmark Button pressed")
            withAnimation {
                isActive.toggle()
            }
        }
    }
}

#Preview {
    FullWidthCheckmarkButton()
}
