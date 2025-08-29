//
//  GoodViewBuilderExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

// ✅ GOOD: Using @ViewBuilder instead of AnyView
struct GoodViewBuilderExample: View {
    @ViewBuilder
    func createContent() -> some View {
        VStack {
            Text("Header")
            Text("Content")
            Button("Action") { }
        }
    }
    
    var body: some View {
        createContent()
    }
}

#Preview {
    GoodViewBuilderExample()
}
