//
//  GoodListExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

// ✅ GOOD: Efficient list without AnyView
struct GoodListExample: View {
    let items: [String]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                HStack {
                    Image(systemName: "circle")
                    Text(item)
                }
            }
        }
    }
}

#Preview {
    GoodListExample(items: ["item1", "item2", "item3", "item4", "item5"])
}
