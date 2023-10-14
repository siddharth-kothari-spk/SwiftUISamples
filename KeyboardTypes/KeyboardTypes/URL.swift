//
//  URL.swift
//  KeyboardTypes
//
//  Created by Siddharth Kothari on 14/10/23.
//

import SwiftUI

struct URL: View {
    @Binding var myText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("URL")
            TextField("URL", text: $myText)
                .keyboardType(.URL)
        }
    }
}

//#Preview {
//    URL()
//}
