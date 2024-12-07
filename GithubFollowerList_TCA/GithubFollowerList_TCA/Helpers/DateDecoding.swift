//
//  DateDecodingStrategy.swift
//  GithubFollowerList_TCA
//
//  Created by Siddharth Kothari on 06/12/24.
//

import Foundation
import SwiftUI

struct DateDecoding {
    // TODO: check for decode method
    func decode<T>(_ decoder: Decoder) throws -> T where T: Decodable {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        guard let date = dateFormatter.date(from: dateString) else {
            throw RepoError.dataCorruptedError(description: "Invalid date format: \(dateString)")
        }
        
        return date as! T
    }
    
    func customDateDecodingStrategy() -> JSONDecoder.DateDecodingStrategy {
        return .custom { decoder -> Date in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            // Define your date formatter
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            // Convert the string to a Date
            guard let date = formatter.date(from: dateString) else {
                throw RepoError.dataCorruptedError(description: "Invalid date format: \(dateString)")
            }
            return date
            
//            if let date = formatter.date(from: dateString) {
//                return date
//            } else {
//                throw DecodingError.dataCorruptedError(
//                    in: container,
//                    debugDescription: "Invalid date format: \(dateString)"
//                )
//            }
        }
    }
}


