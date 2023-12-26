//
//  LastScreen.swift
//  NavigationStack
//
//  Created by Siddharth Kothari on 26/12/23.
//

import Foundation

import SwiftUI

struct LastScreen: View {
    let items: [DataModel]
    let selectedItem: String
    
    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.text)
            }
        }
        .navigationTitle(selectedItem)
    }
}

#Preview {
    LastScreen(items: SampleData.firstScreenData, selectedItem: "")
}
