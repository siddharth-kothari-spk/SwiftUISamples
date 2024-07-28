//
//  WeatherManager.swift
//  WeatherDemo
//
//  Created by Siddharth Kothari on 28/07/24.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid={API key}")  else {
            fatalError("Missing url")
        }
        
    }
}
