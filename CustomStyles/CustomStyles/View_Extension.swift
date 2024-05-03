//
//  View_Extension.swift
//  CustomStyles
//
//  Created by Siddharth Kothari on 03/05/24.
//

import SwiftUI

struct View_Extension: View {
    var body: some View {
        ReusableViewExtensionDemo()
    }
}

#Preview {
    View_Extension()
}

extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let neumorphictextColor = Color(red: 132 / 255, green: 132 / 255, blue: 132 / 255)
}

extension View {
    func neumorphicStyle() -> some View {
        self
            .padding()
            .foregroundColor(.neumorphictextColor)
            .background(Color.background)
            .cornerRadius(6)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
    }
}

struct ReusableViewExtensionDemo: View {
    @State var text = ""

    var body: some View {
        VStack(spacing: 30) {
            Button(action: {}
                , label: {
                Text("Button")
            })
            .neumorphicStyle()
            
            Text("text")
                .neumorphicStyle()

            TextField("Enter something...", text: $text)
                .neumorphicStyle()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
       .background(Color.background)


    }
}
