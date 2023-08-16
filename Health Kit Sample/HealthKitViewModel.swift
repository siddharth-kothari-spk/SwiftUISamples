//
//  HealthKitViewModel.swift
//  Health Kit Sample
//
//  Created by Siddharth Kothari on 16/08/23.
//

import Foundation
import HealthKit

class HealthKitViewModel: ObservableObject {
    private var healthStore = HKHealthStore()
    private var healthKitManager = HealthKitManager()
    @Published var userStepCount = ""
    @Published var isAuthorized = false
    
    func healthRequest() {
        healthKitManager.setupHealthRequest(healthStore: healthStore) {
            self.changeAuthorizationStatus()
            self.readStepsTakenInDay()
        }
    }
    
    func changeAuthorizationStatus() {
        
    }
    
    func readStepsTakenInDay() {
        
    }
}
