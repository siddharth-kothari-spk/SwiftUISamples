//
//  NewLocationManager.swift
//  Accessing User Location
//
//  Created by Siddharth Kothari on 08/10/23.
//

import Foundation
import CoreLocation
import SwiftUI

@Observable
final class NewLocationManager {
    var location: CLLocation? = nil
    
    private let locationManager = CLLocationManager()
    
    func requestUserAuthorization() async throws {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startCurrentLocationUpdates() async throws {
        for try await locationUpdate in CLLocationUpdate.liveUpdates() {
            guard let location = locationUpdate.location else { return }
            
            self.location = location
        }
    }
}
