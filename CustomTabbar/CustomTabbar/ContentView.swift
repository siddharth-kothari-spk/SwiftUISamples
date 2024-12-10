//
//  ContentView.swift
//  CustomTabbar
//
//  Created by Siddharth Kothari on 10/12/24.
//
// https://x.com/sucodeee/status/1841785568188912061

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct TabBar: Identifiable {
    var id = UUID()
    var icon: String
    var tab: TabIcon
}

enum TabIcon: String {
    case home
    case card
    case location
    case purchase
    case notification
}

let tabItems: [TabBar] = [
    TabBar(icon: "square.stack", tab: .card),
    TabBar(icon: "location", tab: .location),
    TabBar(icon: "house", tab: .home),
    TabBar(icon: "purchase", tab: .purchase),
    TabBar(icon: "notification", tab: .notification)
]
