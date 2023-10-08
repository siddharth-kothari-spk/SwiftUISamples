//
//  OldLocationManager.swift
//  Accessing User Location
//
//  Created by Siddharth Kothari on 08/10/23.
//

import Foundation

@Observable
class OldLocationManager: NSObject, CLLocationManagerDelegate {
    var location: CLLocation? = nil
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestUserAuthorization() async throws {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startCurrentLocationUpdates() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        self.location = location
    }
}
