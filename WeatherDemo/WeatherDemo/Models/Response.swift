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
    let rain: Rain?
    let snow: Snow?
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
    let temp, feelsLike, tempMin, tempMax, humidity: Double
    let pressure, seaLevel, grndLevel: Int

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
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
        case the3H = "3h"
    }
}

// MARK: - Snow
struct Snow: Codable {
    let the1H: Double
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
        case the3H = "3h"
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
    let gust: Double?
}

//
/*
 {
   "coord": {
     "lon": 77.705,
     "lat": 12.904
   },
   "weather": [
     {
       "id": 802,
       "main": "Clouds",
       "description": "scattered clouds",
       "icon": "03d"
     }
   ],
   "base": "stations",
   "main": {
     "temp": 22.53,
     "feels_like": 23.01,
     "temp_min": 21,
     "temp_max": 22.9,
     "pressure": 1008,
     "humidity": 83,
     "sea_level": 1008,
     "grnd_level": 910
   },
   "visibility": 6000,
   "wind": {
     "speed": 6.17,
     "deg": 250
   },
   "clouds": {
     "all": 40
   },
   "dt": 1722132860,
   "sys": {
     "type": 1,
     "id": 9205,
     "country": "IN",
     "sunrise": 1722126835,
     "sunset": 1722172632
   },
   "timezone": 19800,
   "id": 1277333,
   "name": "Bengaluru",
   "cod": 200
 }
 */
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
