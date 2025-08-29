//
//  BadViewBuilderExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

// ❌ BAD: Overusing AnyView when @ViewBuilder would work
struct BadViewBuilderExample: View {
    func createContent() -> AnyView {
        AnyView(
            VStack {
                Text("Header")
                Text("Content")
                Button("Action") { }
            }
        )
    }
    
    var body: some View {
        createContent()
    }
}

#Preview {
    BadViewBuilderExample()
}
