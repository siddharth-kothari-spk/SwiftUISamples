//
//  ContentView.swift
//  Chat_Interface
//
//  Created by Siddharth Kothari on 16/05/24.
//

import SwiftUI

@MainActor
struct ChatView: View {

    @Bindable private var viewModel: ChatViewModel = ChatViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                ChatMessagesList(viewModel: viewModel)
                HStack {
                    MessageTextField(draftMessage: $viewModel.draftMessage)
                    SendMessageButton {
                        viewModel.sendMessage()
                    }.disabled(!viewModel.canSendMessage) // send message button is disabled if the user hasn’t typed anything yet
                    
                }
                .padding(8)
            }
            .navigationTitle("Chat")
        }
    }
}

#Preview {
    ChatView()
}
