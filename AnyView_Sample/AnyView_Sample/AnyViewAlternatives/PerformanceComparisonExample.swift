//
//  PerformanceComparisonExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 30/08/25.
//

import SwiftUI

// ============================================
// 10. Performance Comparison Example
// ============================================

// Demonstrate performance differences between approaches
struct PerformanceComparisonExample: View {
    @State private var counter = 0
    @State private var useAnyView = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Performance Comparison")
                .font(.headline)
            
            Text("Counter: \(counter)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Toggle("Use AnyView (slower)", isOn: $useAnyView)
            
            // This demonstrates the performance difference
            if useAnyView {
                AnyView(optimizedContent())
            } else {
                optimizedContent()
            }
            
            HStack {
                Button("Increment") {
                    counter += 1
                }
                
                Button("Reset") {
                    counter = 0
                }
            }
            .buttonStyle(.bordered)
            
            Text("Toggle between approaches and increment rapidly to see the difference")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
    
    @ViewBuilder
    func optimizedContent() -> some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<50, id: \.self) { index in
                    HStack {
                        Text("Item \(index)")
                        Spacer()
                        Text("Value: \(counter + index)")
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 2)
                    .background(
                        index % 2 == 0 ?
                        Color.gray.opacity(0.05) :
                        Color.clear
                    )
                }
            }
            .background(Color.gray.opacity(0.02))
            .cornerRadius(8)
        }
        
    }
}

#Preview {
    PerformanceComparisonExample()
}
