//
//  CustomResultBuilderExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 30/08/25.
//

import SwiftUI

// ============================================
// 9. Result Builder Pattern (Advanced ViewBuilder)
// ============================================

// Create custom result builders for specialized view composition
@resultBuilder
struct ConditionalViewBuilder {
    static func buildBlock<Content: View>(_ content: Content) -> Content {
        content
    }
    
    static func buildBlock<C0: View, C1: View>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)> {
        TupleView((c0, c1))
    }
    
    static func buildEither<TrueContent: View, FalseContent: View>(
        first component: TrueContent
    ) -> _ConditionalContent<TrueContent, FalseContent> {
        ViewBuilder.buildEither(first: component)
    }
    
    static func buildEither<TrueContent: View, FalseContent: View>(
        second component: FalseContent
    ) -> _ConditionalContent<TrueContent, FalseContent> {
        ViewBuilder.buildEither(second: component)
    }
    
    static func buildOptional<Content: View>(_ component: Content?) -> Content? {
        component
    }
    
    static func buildArray<Content: View>(_ components: [Content]) -> some View {
        VStack {
            ForEach(0..<components.count, id: \.self) { index in
                components[index]
            }
        }
    }
}

// Usage of custom result builder
struct CustomResultBuilderExample: View {
    @State private var showAdvanced = false
    @State private var userLevel: Int = 1
    
    var body: some View {
        VStack {
            Text("Custom Result Builder Example")
                .font(.headline)
            
            customContent {
                Text("Always visible content")
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                
                if showAdvanced {
                    Text("Advanced content")
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(8)
                }
                
                if userLevel > 2 {
                    Text("Expert level content")
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            
            // Controls
            VStack {
                Toggle("Show Advanced", isOn: $showAdvanced)
                
                Stepper("User Level: \(userLevel)", value: $userLevel, in: 1...5)
            }
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(12)
        }
        .padding()
    }
    
    @ConditionalViewBuilder
    func customContent<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        VStack(spacing: 12) {
            content()
        }
        .padding()
        .background(Color.gray.opacity(0.02))
        .cornerRadius(12)
    }
}

#Preview {
    CustomResultBuilderExample()
}
