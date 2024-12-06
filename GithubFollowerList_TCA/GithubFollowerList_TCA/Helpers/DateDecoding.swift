//
//  DateDecodingStrategy.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 06/12/24.
//

import Foundation
import SwiftUI

struct DateDecoding {
    func decode<T>(_ decoder: Decoder) throws -> T where T: Decodable {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        guard let date = dateFormatter.date(from: dateString) else {
            throw RepoError.dataCorruptedError
        }
        
        return date as! T
    }
}


