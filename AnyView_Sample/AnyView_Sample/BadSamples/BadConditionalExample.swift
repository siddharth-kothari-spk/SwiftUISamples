//
//  BadConditionalExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

// ❌ BAD: Using AnyView for simple conditional rendering
struct BadConditionalExample: View {
    let isLoggedIn: Bool
    
    var body: some View {
        VStack {
            if isLoggedIn {
                AnyView(Text("Welcome back!").foregroundColor(.green))
            } else {
                AnyView(Text("Please log in").foregroundColor(.red))
            }
        }
    }
}

#Preview {
    BadConditionalExample(isLoggedIn: false)
}
