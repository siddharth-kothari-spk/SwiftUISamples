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
                    }
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
