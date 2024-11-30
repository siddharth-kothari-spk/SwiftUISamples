//
//  GithubFollowerList_TCAApp.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 26/11/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct GithubFollowerList_TCAApp: App {
    static let store = StoreOf<FollowerListFeature>(initialState: FollowerListFeature.State(), reducer: {
        FollowerListFeature()
    })
    var body: some Scene {
        WindowGroup {
            FollowerListView(store: GithubFollowerList_TCAApp.store)
        }
    }
}
