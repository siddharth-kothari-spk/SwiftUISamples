//
//  From_iOS16.swift
//  NavigationStack2
//
//  Created by Siddharth Kothari on 09/03/24.
//

import SwiftUI

struct From_iOS16: View {
    var body: some View {
        // Starting from iOS 16, you replace NavigationView with the new NavigationStack
        // style 1
        NavigationStack {
            NavigationLink {
                Text("Destination")
            } label: {
                Text("Tap me")
            }
        }
    }
}

#Preview {
    From_iOS16()
}
