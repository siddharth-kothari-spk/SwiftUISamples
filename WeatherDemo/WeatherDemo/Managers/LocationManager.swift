//
//  LocationManager.swift
//  WeatherDemo
//
//  Created by Siddharth Kothari on 23/07/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D? // need as optional if user does not gives permission
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting location")
        isLoading = false
    }
}
