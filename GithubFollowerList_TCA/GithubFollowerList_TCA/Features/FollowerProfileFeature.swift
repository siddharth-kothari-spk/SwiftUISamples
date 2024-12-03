//
//  FollowerProfileFeature.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 01/12/24.
//

import Foundation
import ComposableArchitecture

// api: https://api.github.com/users/USERNAME/repos

@Reducer
struct FollowerProfileFeature {
    @ObservableState
    struct State {
        let follower: Follower
        var repos: [Repo] = []
    }
    
    enum Action {
        case fetchAdditionalDetails
        case fetchAdditionalDetailsSuccess
        case fetchAdditionalDetailsFailure(Error)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchAdditionalDetails:
                print("fetch additional details")
                print(state.follower.reposURL)
                return .none
            case .fetchAdditionalDetailsSuccess:
                print("")
                return .none
            case .fetchAdditionalDetailsFailure(let error):
                print("error")
                return .none
            }
        }
    }
}
