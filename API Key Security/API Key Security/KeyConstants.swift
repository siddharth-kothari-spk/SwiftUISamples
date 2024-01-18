//
//  KeyConstants.swift
//  API Key Security
//
//  Created by Siddharth Kothari on 18/01/24.
//

import Foundation

enum KeyConstants {
    static func loadAPIKeys() async throws {
        let request = NSBundleResourceRequest(tags: ["APIKeys"])
        try await request.beginAccessingResources()
        
        let url = Bundle.main.url(forResource: "APIKeys", withExtension: ".json")
        let data = try Data(contentsOf: url!)
        APIKeys.storage = try JSONDecoder().decode([String: String].self, from: data)
        request.endAccessingResources()
    }
    
    enum APIKeys {
        static fileprivate(set) var storage = [String: String]()
        static var serviceA: String { storage["ServiceA"] ?? "no service A"}
        static var serviceB: String { storage["ServiceB"] ?? "no service B"}

    }
}
