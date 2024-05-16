//
//  ChatMessageList.swift
//  Chat_Interface
//
//  Created by Siddharth Kothari on 16/05/24.
//

import SwiftUI

import SwiftUI

struct ChatMessagesList: View {

    @Bindable var viewModel: ChatViewModel

    var body: some View {
        ScrollView {
            ForEach(viewModel.messages) { message in
                MessageCell(message: message)
                    .padding(message.role.padding)
            }
        }
        .defaultScrollAnchor(.bottom)
    }
}
