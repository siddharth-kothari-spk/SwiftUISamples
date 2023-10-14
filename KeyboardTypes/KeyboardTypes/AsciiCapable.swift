//
//  AsciiCapable.swift
//  KeyboardTypes
//
//  Created by Siddharth Kothari on 14/10/23.
//

import SwiftUI

struct AsciiCapable: View {
    
    @Binding var myText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("asciiCapable")
            TextField("ascii", text: $myText)
                .keyboardType(.asciiCapable)
        }
    }
}
