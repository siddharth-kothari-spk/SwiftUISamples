//
//  Custom_View_Modifier.swift
//  CustomStyles
//
//  Created by Siddharth Kothari on 03/05/24.
//

import SwiftUI

struct Custom_View_Modifier: View {
    var body: some View {
        ReusableViewModifierDemo()
    }
}

#Preview {
    Custom_View_Modifier()
}

struct ReusableViewModifierDemo: View {
    @State var text = ""
    
    var body: some View {
        let modifier = CustomViewModifier(
            cornerRadius: 16, startColor: .yellow, endColor: .blue, textColor: .black)
        
        VStack(spacing: 30) {
                    Button(action: {}
                        , label: {
                        Text("Button")
                    })
                    .modifier(modifier)
                    
                    Text("text")
                        .modifier(modifier)
                    
                    TextField("Enter something...", text: $text)
                        .modifier(modifier)
                }
        
    }
}

struct CustomViewModifier: ViewModifier {
    
    var cornerRadius: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .padding(3)
            .foregroundStyle(textColor)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
            .font(.system(size: 18))
            .shadow(radius: 10)
    }
}
