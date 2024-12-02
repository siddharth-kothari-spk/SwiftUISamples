//
//  FollowerProfileView.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 01/12/24.
//

import SwiftUI
import ComposableArchitecture

struct FollowerProfileView: View {
    let store: StoreOf<FollowerProfileFeature>
    
    var body: some View {
        Text(store.follower.avatarURL)
            .background(.blue)
    }
}

//#Preview {
//    FollowerProfileView()
//}
