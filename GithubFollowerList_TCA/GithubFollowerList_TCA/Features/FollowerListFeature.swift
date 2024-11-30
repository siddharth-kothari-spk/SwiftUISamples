//
//  Feature.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 29/11/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct FollowerListFeature {
    // if feature is to be observed by SwiftUI, which is usually the case, you must annotate its state with the ObservableState() macro. It is the Composable Architecture’s version of @Observable, but tuned to value types
    @ObservableState
    // create a State type that holds the state your feature needs to do its job. generally struct
    struct State {
        var isLoading = false
        var followers: [Follower] = []
        var error: Error?
    }
    // create an Action type that holds all the actions the user can perform in the feature. generally enum
    enum Action {
        case fetchData
        case fetchDataSuccess([Follower])
        case fetchDataFailure(Error)
        case selectFollower(Follower)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .fetchData:
                print("add code to fetch data")
                return .none // currently returning none, will be updated as we progress
            case .fetchDataSuccess(let followers):
                print("fetch data success")
                return .none
            case .fetchDataFailure(let error):
                print("fetch data failure")
                return .none
            case .selectFollower(let follower):
                print("select follower")
                return .none
            }
            
        }
    }
    
}
