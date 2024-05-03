//
//  Define_Custom_Struct.swift
//  CustomStyles
//
//  Created by Siddharth Kothari on 03/05/24.
//

import SwiftUI

struct Define_Custom_Struct: View {
    var body: some View {
        StarTextFieldDemo()
    }
}

#Preview {
    Define_Custom_Struct()
}

struct StarTextFieldDemo: View {
    @State var text = ""

    var body: some View {
        VStack(spacing: 30) {
            StarTextField() {
                TextField("Enter something...", text: $text)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding()
        .background(Color.gray.opacity(0.2))


    }
}

struct StarTextField: View {
    @ViewBuilder var textField: TextField<Text>

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "star")
            textField
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
        .cornerRadius(8)
    }
}
