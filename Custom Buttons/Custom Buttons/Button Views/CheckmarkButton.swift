//
//  CheckmarkButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct CheckmarkButton: View {
    @State var isActive = false
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: isActive ? "checkmark.square.fill" : "")
                .resizable()
                .frame(width: 18, height: 18)
                .cornerRadius(2)
                .overlay {
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.black)
                        .frame(width: 18, height: 18)
                }
            
            Text("Checkmark Button ")
        }
        .onTapGesture {
            print("Checkmark Button pressed")
            withAnimation {
                isActive.toggle()
            }
        }
    }
}

#Preview {
    CheckmarkButton()
}
