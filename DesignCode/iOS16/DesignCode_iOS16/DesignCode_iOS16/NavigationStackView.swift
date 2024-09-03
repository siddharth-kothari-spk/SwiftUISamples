//
//  NavigationStackView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 03/09/24.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationStack {
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Text("Test navigation stack")
                NavigationLink {
                    Text("NAV link")
                } label: {
                    Label("Test navigation link", systemImage: "circle.fill")
                        .foregroundStyle(.primary)
                }

                
            }
            .navigationTitle("navigation title")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
    }
}

#Preview {
    NavigationStackView()
}
