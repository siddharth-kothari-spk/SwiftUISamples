//
//  ModelData.swift
//  WeatherDemo
//
//  Created by Siddharth Kothari on 28/07/24.
//

import Foundation

var previewWeather: Response = load("weatherData.json")
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Could not find file \(filename) in bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Could not load file \(filename) from bundle")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    }
    catch {
        fatalError("Could not parse \(filename) as \(T.self) \n \(error)")
    }
}
