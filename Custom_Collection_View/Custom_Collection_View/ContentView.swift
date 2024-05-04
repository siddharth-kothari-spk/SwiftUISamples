//
//  ContentView.swift
//  Custom_Collection_View
//
//  Created by Siddharth Kothari on 04/05/24.
//

// courtsey: https://blog.stackademic.com/swiftui-custom-collectionview-ea06c4a6bc70
// Challenge: A CollectionView with dynamic number of columns (may differ by row) depending on the item width.

import SwiftUI
let items: [String] = ["item 1", "item 2 - long long long long long long", "item 3", "item 4", "item 5", "item 6", "item 7 - medium", "item 8"]

struct ContentView: View {
    var body: some View {
        VStack {
            CustomCollectionView(items: items)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
