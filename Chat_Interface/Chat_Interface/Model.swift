//
//  Model.swift
//  Chat_Interface
//
//  Created by Siddharth Kothari on 16/05/24.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let role: Role
    let text: String
}

enum Role {
    case sender, receiver
}
