//
//  MenuView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 08/09/24.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("selectedItem") var selectedItem: Menu = .eraser
    @Environment(\.dismiss) var dismiss
    var body: some View {
        List(navigationItems) { item in
            Button(action: {
                // change menu
                selectedItem = item.menu
                dismiss()
            }, label: {
                Label(item.title, systemImage: item.icon)
                    .foregroundStyle(.purple)
                    .padding(8)
            })
            
        }
        .listStyle(.plain)
    }
}

#Preview {
    MenuView()
}
