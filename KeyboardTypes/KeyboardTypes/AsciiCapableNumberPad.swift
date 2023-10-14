//
//  AsciiCapableNumberPad.swift
//  KeyboardTypes
//
//  Created by Siddharth Kothari on 14/10/23.
//

import SwiftUI

struct AsciiCapableNumberPad: View {
    @Binding var myText: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("asciiCapableNumberPad")
            TextField("asciiCapableNumberPad", text: $myText)
                .keyboardType(.asciiCapableNumberPad)
        }
    }
}

//#Preview {
//    AsciiCapableNumberPad()
//}
