//
//  NumbersAndPunctuation.swift
//  KeyboardTypes
//
//  Created by Siddharth Kothari on 14/10/23.
//

import SwiftUI

struct NumbersAndPunctuation: View {
    @Binding var myText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("numbersAndPunctuation")
            TextField("numbersAndPunctuation", text: $myText)
                .keyboardType(.numbersAndPunctuation)
        }
    }
}

//#Preview {
//    @State var myTextPreview: String = "test"
//    _ = NumbersAndPunctuation(myText: $myTextPreview)
//}
