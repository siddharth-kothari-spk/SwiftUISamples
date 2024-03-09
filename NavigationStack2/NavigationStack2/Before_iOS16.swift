//
//  Before_iOS16.swift
//  NavigationStack2
//
//  Created by Siddharth Kothari on 09/03/24.
//

import SwiftUI

struct Before_iOS16: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("Destination")
            } label: {
                Text("Tap me")
            }
        }
        // This creates a basic navigation based interface with a Tap me button. When tapped, the app navigates one level down to display the destination view.
    }
}

#Preview {
    Before_iOS16()
}
