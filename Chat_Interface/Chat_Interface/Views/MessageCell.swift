//
//  MessageCell.swift
//  Chat_Interface
//
//  Created by Siddharth Kothari on 16/05/24.
//

import SwiftUI

struct MessageCell: View {

    let message: Message

    var body: some View {
        HStack {
            if message.role == .sender { Spacer() }
            MessageBubble(message: message)
            if message.role == .receiver { Spacer() }
        }
    }
}

#Preview {
    MessageCell(message: Message(
        role: .sender,
        text: "Here's to the crazy ones"
    ))
}
