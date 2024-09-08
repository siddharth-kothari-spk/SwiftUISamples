//
//  MenuView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 08/09/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        List(navigationItems) { item in
            Button(action: {
                // change menu
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
