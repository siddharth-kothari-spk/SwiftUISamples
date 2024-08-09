//
//  QueryTag.swift
//  VideoPlayerDemo
//
//  Created by Siddharth Kothari on 08/08/24.
//

import SwiftUI

struct QueryTag: View {
    var query: Query
    var isSelected: Bool
    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundStyle(isSelected ? .black : .gray)
            .padding(10)
            .background(.thinMaterial)
            .clipShape(.capsule)
    }
}

#Preview {
    QueryTag(query: Query.animals, isSelected: true)
}
