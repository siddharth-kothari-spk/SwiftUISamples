//
//  ContentView.swift
//  VideoPlayerDemo
//
//  Created by Siddharth Kothari on 08/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(Query.allCases, id: \.self) { searchQuery in
                    QueryTag(query: searchQuery, isSelected: true)
                }
            }
        }
        .padding()
        .background(Color("AccentColor"))
    }
}

#Preview {
    ContentView()
}
