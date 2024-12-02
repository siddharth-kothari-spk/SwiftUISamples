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
        VStack(content: {
            AsyncImage(url: URL(string:store.follower.avatarURL)) { image in
                image.resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            } placeholder: {
                ProgressView {
                    Text("Image loading")
                }
            }
                        
            Text("Git username: \(store.follower.login)")
            Text("Github link: \(store.follower.htmlURL)")
        })
    }
}

//#Preview {
//    FollowerProfileView()
//}
