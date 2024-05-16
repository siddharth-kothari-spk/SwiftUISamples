//
//  Model.swift
//  Chat_Interface
//
//  Created by Siddharth Kothari on 16/05/24.
//

import Foundation
import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let role: Role
    let text: String
}

enum Role {
    case sender, receiver
}

extension Role {
    var bubbleColor: Color {
        switch self {
        case .sender: return .blue
        case .receiver: return .init(uiColor: .init(red: 240 / 255, green: 238 / 255, blue: 237 / 255, alpha: 1))
        }
    }

    var textColor: Color {
        switch self {
        case .sender: return .white
        case .receiver: return .black
        }
    }

    var cornerRadii: RectangleCornerRadii {
        switch self {
        case .sender: return .init(topLeading: 10, bottomLeading: 10, topTrailing: 10)
        case .receiver: return .init(topLeading: 10, bottomTrailing: 10, topTrailing: 10)
        }
    }

    var padding: EdgeInsets {
        switch self {
        case .sender: return .init(top: 0, leading: 32, bottom: 0, trailing: 8)
        case .receiver: return .init(top: 0, leading: 8, bottom: 0, trailing: 32)
        }
    }
}
