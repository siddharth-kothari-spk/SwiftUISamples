//
//  ContentView.swift
//  CustomTabbar
//
//  Created by Siddharth Kothari on 10/12/24.
//
// https://x.com/sucodeee/status/1841785568188912061

import SwiftUI

struct ContentView: View {
    @State var selectedTab: TabIcon = .home
    @State var xOffset = 2 * 70.0
    
    var body: some View {
        HStack {
            ForEach(Array(tabItems.enumerated()), id: \.element.id) { index, item in
                Spacer()
                Image(systemName: item.icon)
                    .bold()
                    .symbolVariant(selectedTab == item.tab ? .fill : .none)
                    .contentTransition(.symbolEffect)
                    .onTapGesture {
                        withAnimation(.spring) {
                            selectedTab = item.tab
                            xOffset = CGFloat(index) * 70 + CGFloat(index - 2)
                        }
                    }
                Spacer()
            }
        }
        .frame(height: 70)
        .background(.thinMaterial, in: .capsule)
        .overlay(alignment: .bottomLeading) {
            Circle()
                .frame(width: 10, height: 10)
                .offset(x: 35 + xOffset, y: -5)
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
    TabBar(icon: "purchased.circle", tab: .purchase),
    TabBar(icon: "bell.badge", tab: .notification)
]
