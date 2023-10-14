//
//  Twitter.swift
//  KeyboardTypes
//
//  Created by Siddharth Kothari on 14/10/23.
//

import SwiftUI

struct Twitter: View {
    @Binding var myText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("twitter")
            TextField("twitter", text: $myText)
                .keyboardType(.twitter)
        }    }
}

//#Preview {
//    Twitter()
//}
