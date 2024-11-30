//
//  Follower.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 30/11/24.
//

import Foundation

struct Follower: Identifiable {
    let id: Int
    let login: String
    let avatarUrl: URL
    let htmlUrl: URL
}
