//
//  Feature.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 29/11/24.
//

import Foundation
import ComposableArchitecture

struct Follower: Identifiable {
    let id: Int
    let login: String
    let avatarUrl: URL
    let htmlUrl: URL
}

