//
//  Conform_to_Style_Protocol.swift
//  CustomStyles
//
//  Created by Siddharth Kothari on 03/05/24.
//

import SwiftUI

struct Conform_to_Style_Protocol: View {
    var body: some View {
        ReusableButtonStyleDemo()
    }
}

#Preview {
    Conform_to_Style_Protocol()
}


struct ReusableButtonStyleDemo: View {
    var body: some View {
        
        VStack {
            Button {
                // action
            } label: {
                Text("Button")
        }.buttonStyle(CustomButtonStyle())
        }

    }
}


struct CustomButtonStyle: ButtonStyle {
   
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.red)
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .opacity(configuration.isPressed ? 0.8 : 1)
            .animation(.bouncy, value: configuration.isPressed)
    }
}

// Similarly for Textfield we have TextFieldStyle
