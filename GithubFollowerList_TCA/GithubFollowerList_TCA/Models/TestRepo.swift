//
//  TestRepo.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 06/12/24.
//

import Foundation

struct TestRepo: Identifiable {
    let id: Int
    let name: String
    let url: String
    let createdAt, updatedAt, pushedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
    }
}

extension TestRepo: Decodable {}

enum RepoError: Error {
    case dataCorruptedError(description: String)
}
