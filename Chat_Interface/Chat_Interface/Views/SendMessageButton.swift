//
//  SendMessageButton.swift
//  Chat_Interface
//
//  Created by Siddharth Kothari on 16/05/24.
//

import SwiftUI

import SwiftUI

struct SendMessageButton: View {

    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "paperplane.circle.fill")
                .font(.title)
        }
    }
}
