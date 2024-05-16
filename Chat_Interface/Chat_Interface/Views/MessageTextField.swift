//
//  MessageTextField.swift
//  Chat_Interface
//
//  Created by Siddharth Kothari on 16/05/24.
//

import SwiftUI

import SwiftUI

struct MessageTextField: View {

    @Binding var draftMessage: String

    var body: some View {
        TextField("Message...", text: $draftMessage)
            .textFieldStyle(.plain)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(.blue, lineWidth: 1)
            )
    }
}
