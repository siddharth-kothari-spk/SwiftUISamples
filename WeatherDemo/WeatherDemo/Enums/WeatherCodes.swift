//
//  WeatherCodes.swift
//  WeatherDemo
//
//  Created by Siddharth Kothari on 29/07/24.
//

import Foundation

enum WeatherCodes: Int {
    typealias RawValue = Int
    
    // 2xx series : thunderstorm
    case thunderstorm_with_light_rain = 200
    case thunderstorm_with_rain = 201
    case thunderstorm_with_heavy_rain = 202
    
    
    public var description: String {
        
        switch self {
            
        case .thunderstorm_with_light_rain:
            return "thunderstorm with light rain"
            
        case .thunderstorm_with_rain:
            return "thunderstorm with rain"
            
        case .thunderstorm_with_heavy_rain:
            return "thunderstorm with heavy rain"
        }
    }
}
