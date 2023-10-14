//
//  Email.swift
//  KeyboardTypes
//
//  Created by Siddharth Kothari on 14/10/23.
//

import SwiftUI

struct Email: View {
    @Binding var myText: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("emailAddress")
            TextField("emailAddress", text: $myText)
                .keyboardType(.emailAddress)
        }
    }
}

//#Preview {
//    Email()
//}
