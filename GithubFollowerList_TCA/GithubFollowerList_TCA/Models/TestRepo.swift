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
}

extension TestRepo: Decodable {}
