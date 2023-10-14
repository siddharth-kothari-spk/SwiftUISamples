//
//  PhonePad.swift
//  KeyboardTypes
//
//  Created by Siddharth Kothari on 14/10/23.
//

import SwiftUI

struct PhonePad: View {
    @Binding var myText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("phonePad")
            TextField("phonePad", text: $myText)
                .keyboardType(.phonePad)
        }
    }
}

//#Preview {
//    PhonePad()
//}
