//
//  ContentView.swift
//  Custom_Collection_View
//
//  Created by Siddharth Kothari on 04/05/24.
//

// courtsey: https://blog.stackademic.com/swiftui-custom-collectionview-ea06c4a6bc70
// Challenge: A CollectionView with dynamic number of columns (may differ by row) depending on the item width.

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
