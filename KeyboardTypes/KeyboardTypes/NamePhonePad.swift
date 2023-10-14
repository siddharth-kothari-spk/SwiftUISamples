//
//  NamePhonePad.swift
//  KeyboardTypes
//
//  Created by Siddharth Kothari on 14/10/23.
//

import SwiftUI

struct NamePhonePad: View {
    @Binding var myText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("namePhonePad")
            TextField("namePhonePad", text: $myText)
                .keyboardType(.namePhonePad)
        }
    }
}

//#Preview {
//    NamePhonePad()
//}
