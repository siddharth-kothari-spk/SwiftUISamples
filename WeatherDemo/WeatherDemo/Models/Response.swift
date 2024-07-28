//
//  Response.swift
//  WeatherDemo
//
//  Created by Siddharth Kothari on 28/07/24.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Response.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Response: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

// Sample
/*
 
 {
   "coord": {
     "lon": 10.99,
     "lat": 44.34
   },
   "weather": [
     {
       "id": 501,
       "main": "Rain",
       "description": "moderate rain",
       "icon": "10d"
     }
   ],
   "base": "stations",
   "main": {
     "temp": 298.48,
     "feels_like": 298.74,
     "temp_min": 297.56,
     "temp_max": 300.05,
     "pressure": 1015,
     "humidity": 64,
     "sea_level": 1015,
     "grnd_level": 933
   },
   "visibility": 10000,
   "wind": {
     "speed": 0.62,
     "deg": 349,
     "gust": 1.18
   },
   "rain": {
     "1h": 3.16
   },
   "clouds": {
     "all": 100
   },
   "dt": 1661870592,
   "sys": {
     "type": 2,
     "id": 2075663,
     "country": "IT",
     "sunrise": 1661834187,
     "sunset": 1661882248
   },
   "timezone": 7200,
   "id": 3163858,
   "name": "Zocca",
   "cod": 200
 }

 */
