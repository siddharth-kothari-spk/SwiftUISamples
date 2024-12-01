//
//  FollowerProfileFeature.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 01/12/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct FollowerProfileFeature {
    @ObservableState
    struct State {
        let follower: Follower
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
