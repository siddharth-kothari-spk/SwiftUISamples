//
//  InfoTextField.swift
//  CustomTextFieldAnimation
//
//  Created by Siddharth Kothari on 23/11/24.
//

import SwiftUI

struct InfoTextField: View {
    var title: String
    @Binding var text: String
    /// A property wrapper type that can read and write a value owned by a source of truth.
    @FocusState var isActive
    /// A property wrapper type that can read and write a value that SwiftUI updates as the placement of focus within the scene changes.
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            
            Text(title)
                .padding(.horizontal)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0) // moves placeholder on top of TextField once it has value or is focussed
                .foregroundStyle(isActive ? .primary : .secondary)
                .animation(.easeOut, value: isActive)
        }
    }
}

/*
#Preview {
//    @State var testString: String = "testString"
//    InfoTextField(title: "Test", text: $testString)
    
    @State var testString: String = "testString"
       @FocusState var isFocused

       InfoTextField(title: "Test", text: $testString)
           .focused($isFocused)
           .onTapGesture {
               isFocused = true
           }
}
*/
