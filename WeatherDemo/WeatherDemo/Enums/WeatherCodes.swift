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
    case light_thunderstorm = 210
    case thunderstorm = 211
    case heavy_thunderstorm = 212
    case ragged_thunderstorm = 221
    case thunderstorm_with_light_drizzle = 230
    case thunderstorm_with_drizzle = 231
    case thunderstorm_with_heavy_drizzle = 232
    
    // clouds
    case scattered_clouds_25_50_percent = 802
    
    
    public var description: String {
        
        switch self {
          // thunderstorm
        case .thunderstorm_with_light_rain:
            return "thunderstorm with light rain"
            
        case .thunderstorm_with_rain:
            return "thunderstorm with rain"
            
        case .thunderstorm_with_heavy_rain:
            return "thunderstorm with heavy rain"
            
        case .light_thunderstorm:
            return "light thunderstorm"
            
        case .thunderstorm:
            return "thunderstorm"
            
        case .heavy_thunderstorm:
            return "heavy thunderstorm"
            
        case .ragged_thunderstorm:
            return "ragged thunderstorm"
            
        case .thunderstorm_with_light_drizzle:
            return "thunderstorm with light drizzle"
            
        case .thunderstorm_with_drizzle:
            return "thunderstorm with drizzle"
            
        case .thunderstorm_with_heavy_drizzle:
            return "thunderstorm with heavy drizzle"
         
        // clounds
        case .scattered_clouds_25_50_percent:
            return "scattered clouds: 25-50%"
        }
        
        
    }
}
