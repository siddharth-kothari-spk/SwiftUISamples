//
//  BadListExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

// ❌ BAD: Using AnyView in lists (performance killer)
struct BadListExample: View {
    let items: [String]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                AnyView(
                    HStack {
                        Image(systemName: "circle")
                        Text(item)
                    }
                )
            }
        }
    }
}

#Preview {
    BadListExample(items: ["item1", "item2", "item3", "item4", "item5"])
}
