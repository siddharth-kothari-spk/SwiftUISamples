//
//  ModernButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct ModernButton: View {
    var body: some View {
        Button {
            print("ModernButton pressed")
        } label: {
            ZStack(alignment: .leading) {
                Text("Modern Button")
                    .foregroundStyle(.black)
                    .font(.system(size: Constants.customFontSize, weight: Constants.customFontWeight))
                    .padding()
                    .padding(.leading, Constants.customHeight)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.black)
                    }
                
                Image(systemName: "house.fill")
                    .frame(width: Constants.customHeight, height: Constants.customHeight)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(26)
                    .offset(x: -1)
            }
        }
    }
}

#Preview {
    ModernButton()
}
