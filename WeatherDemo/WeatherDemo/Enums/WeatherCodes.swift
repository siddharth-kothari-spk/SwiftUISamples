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
    
    // 3xx series: drizzle
    case light_intensity_drizzle = 300
    case drizzle = 301
    case heavy_intensity_drizzle = 302
    case light_intensity_drizzle_rain = 310
    case drizzle_rain = 311
    case heavy_intensity_drizzle_rain = 312
    case shower_rain_and_drizzle = 313
    case heavy_shower_rain_and_drizzle = 314
    case shower_drizzle = 321
    
    // 5xx series: rain
    case light_rain = 500
    case moderate_rain = 501
    case heavy_intensity_rain = 502
    case very_heavy_rain = 503
    case extreme_rain = 504
    case freezing_rain = 511
    case light_intensity_shower_rain = 520
    case shower_rain = 521
    case heavy_intensity_shower_rain = 522
    case ragged_shower_rain = 531
    
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
            
        
        // drizzle
        case .drizzle:
            return "drizzle"
            
        case .drizzle_rain:
            return "drizzle rain"
            
        case .shower_drizzle:
            return "shower drizzle"
            
        case .heavy_intensity_drizzle:
            return "heavy intensity drizzle"
            
        case .light_intensity_drizzle:
            return "light intensity drizzle"
            
        case .shower_rain_and_drizzle:
            return "shower rain and drizzle"
            
        case .heavy_intensity_drizzle_rain:
            return "heavy intensity drizzle rain"
            
        case .light_intensity_drizzle_rain:
            return "light intensity drizzle rain"
            
        case .heavy_shower_rain_and_drizzle:
            return "heavy shower rain and drizzle"
            
        // rain
        case .light_rain:
            return "light rain"
            
        case .moderate_rain:
            return "moderate rain"
            
        case .heavy_intensity_rain:
            return "heavy intensity rain"
            
        case .very_heavy_rain:
            return "very heavy rain"
            
        case .extreme_rain:
            return "extreme rain"
            
        case .freezing_rain:
            return "freezing rain"
            
        case .light_intensity_shower_rain:
            return "light intensity shower rain"
            
        case .shower_rain:
            return "shower rain"
            
        case .heavy_intensity_shower_rain:
            return "heavy intensity shower rain"
            
        case .ragged_shower_rain:
            return "ragged shower rain"
            
        // clounds
        case .scattered_clouds_25_50_percent:
            return "scattered clouds: 25-50%"
        }
        
        
    }
}
