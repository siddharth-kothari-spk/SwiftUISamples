//
//  Configs.swift
//  Enum_Manage_Configs
//
//  Created by Siddharth Kothari on 02/06/24.
//

import Foundation

enum EnvironmentConfig {
    enum Development {
        static let baseUrl = "http://localhost"
        static let APIKEY = "DEV_API_KEY"
    }
    
    enum Production {
        static let baseUrl = "https://www.123.com"
        static let APIKEY = "PROD_API_KEY"
    }
}
