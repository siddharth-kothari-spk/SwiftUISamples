//
//  JSONCodingKey.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 03/12/24.
//

import Foundation

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
            return nil
    }

    required init?(stringValue: String) {
            key = stringValue
    }

    var intValue: Int? {
            return nil
    }

    var stringValue: String {
            return key
    }
}
