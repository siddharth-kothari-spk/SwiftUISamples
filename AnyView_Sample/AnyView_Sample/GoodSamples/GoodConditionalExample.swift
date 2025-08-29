//
//  GoodConditionalExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

// ✅ GOOD: Simple conditional without AnyView
struct GoodConditionalExample: View {
    let isLoggedIn: Bool
    
    var body: some View {
        VStack {
            if isLoggedIn {
                Text("Welcome back!")
                    .foregroundColor(.green)
            } else {
                Text("Please log in")
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    GoodConditionalExample(isLoggedIn: false)
}
