//
//  ModernButton2.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct ModernButton2: View {
    var body: some View {
        Button {
            print("ModernButton2 pressed")
        } label: {
            ZStack(alignment: .leading) {
                Text("Modern Button2")
                    .foregroundStyle(.black)
                    .font(.system(size: Constants.customFontSize, weight: Constants.customFontWeight))
                    .padding(12)
                    .padding(.leading, 30)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.black)
                    }
                
                Image(systemName: "house.fill")
                    .frame(width: 70, height: 70)
                    .foregroundStyle(.white)
                    .background(.black)
                    .cornerRadius(35)
                    .offset(x: -40)
            }
        }
    }
}

#Preview {
    ModernButton2()
}
