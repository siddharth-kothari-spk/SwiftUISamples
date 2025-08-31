//
//  AdvancedViewBuilderExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 30/08/25.
//

import SwiftUI

// ============================================
// 6. Advanced ViewBuilder Techniques
// ============================================

// ViewBuilder with generic parameters and complex logic
struct SampleItem: Identifiable, CustomStringConvertible {
    let id = UUID()
    let name: String
    
    var description: String {
        return name
    }
}

struct AdvancedViewBuilderExample<T: Identifiable & CustomStringConvertible>: View {
    let items: [T]
    let selection: T.ID?
    let onSelectionChanged: (T.ID) -> Void
    
    var body: some View {
        VStack {
            Text("Advanced ViewBuilder with Generics")
                .font(.headline)
            
            // Complex ViewBuilder with generics
            buildItemList()
        }
        .padding()
    }
    
    @ViewBuilder
    func buildItemList() -> some View {
        if items.isEmpty {
            // Empty state
            VStack(spacing: 16) {
                Image(systemName: "tray")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Text("No items available")
                    .font(.headline)
                    .foregroundColor(.secondary)
                Button("Add Item") {
                    // Add action
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        } else {
            // Item list with complex conditional logic
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(items.indices, id: \.self) { index in
                        let item = items[index]
                        let isSelected = selection == item.id
                        let isFirst = index == 0
                        let isLast = index == items.count - 1
                        
                        buildItemRow(
                            item: item,
                            isSelected: isSelected,
                            isFirst: isFirst,
                            isLast: isLast
                        )
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func buildItemRow(item: T, isSelected: Bool, isFirst: Bool, isLast: Bool) -> some View {
        HStack {
            // Conditional leading icon
            if isFirst {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            } else if isLast {
                Image(systemName: "flag.fill")
                    .foregroundColor(.red)
            } else {
                Image(systemName: "circle.fill")
                    .foregroundColor(.blue)
            }
            
            Text(item.description)
                .font(.body)
                .foregroundColor(isSelected ? .white : .primary)
            
            Spacer()
            
            // Conditional trailing content
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(
            isSelected ?
            Color.blue :
            Color.gray.opacity(0.1)
        )
        .cornerRadius(8)
        .onTapGesture {
            onSelectionChanged(item.id)
        }
        .animation(.easeInOut, value: isSelected)
    }
}

#Preview {
    // Wrapper view to handle state for the preview
    struct PreviewWrapper: View {
        @State private var selectedId: UUID?
        
        let sampleItems = [
            SampleItem(name: "First Item"),
            SampleItem(name: "Second Item"),
            SampleItem(name: "Third Item"),
            SampleItem(name: "Fourth Item")
        ]
        
        var body: some View {
            AdvancedViewBuilderExample(
                items: sampleItems,
                selection: selectedId,
                onSelectionChanged: { id in
                    selectedId = id // Update selection to highlight new item
                }
            )
        }
    }
    
    return PreviewWrapper()
}

// Alternative preview showing empty state
#Preview("Empty State") {
    AdvancedViewBuilderExample<SampleItem>(
        items: [],
        selection: nil,
        onSelectionChanged: { _ in }
    )
}
