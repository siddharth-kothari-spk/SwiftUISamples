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
        guard let stepQuantityType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
            let authorizationStatus = self.healthStore.authorizationStatus(for: stepQuantityType)
            
            switch authorizationStatus {
            case .notDetermined:
                isAuthorized = false
            case .sharingDenied:
                isAuthorized = false
            case .sharingAuthorized:
                DispatchQueue.main.async {
                    self.isAuthorized = true
                }
            @unknown default:
                isAuthorized = false
            }
    }
    
    func readStepsTakenInDay() {
        healthKitManager.readStepCount(forToday: Date(), healthStore: healthStore) { step in
            if step != 0.0 {
                DispatchQueue.main.async {
                    self.userStepCount = String(format: "%.0f", step)
                }
            }
        }
    }
}
