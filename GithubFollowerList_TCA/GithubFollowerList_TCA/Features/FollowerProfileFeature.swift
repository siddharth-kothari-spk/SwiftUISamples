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
        var isLoading = false
        let follower: Follower
        var repos: [TestRepo] = []
        var error: Error?
    }
    
    enum Action {
        case fetchAdditionalDetails
        case fetchAdditionalDetailsSuccess([TestRepo])
        case fetchAdditionalDetailsFailure(Error)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchAdditionalDetails:
                print("fetch additional details")
                state.isLoading = true
                print(state.follower.reposURL)
                if let repoURL = URL(string: state.follower.reposURL) {
                    return .run { send in
                        let (data, _) = try await URLSession.shared.data(from: repoURL)
                        let repos = try JSONDecoder().decode([TestRepo].self, from: data)
                        print("Repos: \(repos)")
                        await send(.fetchAdditionalDetailsSuccess(repos))
                    }
                }
                return .none
            case .fetchAdditionalDetailsSuccess(let repos):
                print("")
                state.isLoading = false
                state.repos = repos
                return .none
            case .fetchAdditionalDetailsFailure(let error):
                print("error")
                state.isLoading = false
                state.error = error
                return .none
            }
        }
    }
}
