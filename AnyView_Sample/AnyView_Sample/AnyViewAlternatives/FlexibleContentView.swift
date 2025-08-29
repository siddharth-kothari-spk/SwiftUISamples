//
//  FlexibleContentView.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

// ✅ PREFERRED: Using @ViewBuilder for flexible content
struct FlexibleContentView: View {
    let items: [ContentItem]
    
    var body: some View {
        LazyVStack {
            ForEach(items) { item in
                buildItemView(for: item)
            }
        }
    }
    
    @ViewBuilder
    func buildItemView(for item: ContentItem) -> some View {
        switch item.type {
        case .text:
            Text(item.content)
                .padding()
        case .image:
            AsyncImage(url: URL(string: item.content)) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        case .button:
            Button(item.content) {
                // Handle action
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    FlexibleContentView(items: [ContentItem(type: .button, content: "button type content")])
}


struct ContentItem: Identifiable {
    let id = UUID()
    let type: ContentType
    let content: String
}

enum ContentType {
    case text, image, button
}
