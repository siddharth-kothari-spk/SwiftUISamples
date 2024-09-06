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
            List(navigationItems) { item in
                NavigationLink {
                    VStack {
                        Text("ID: \(item.id)")
                            .padding(8)
                            .multilineTextAlignment(.center)
                        Image(systemName: item.icon)
                            .resizable()
                            .frame(width: 100, height: 100)
                        .font(.largeTitle)
                    }
                    .padding()
                } label: {
                    Label(item.title, systemImage: item.icon)
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
