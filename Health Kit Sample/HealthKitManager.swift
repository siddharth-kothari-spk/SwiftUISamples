//
//  HealthKitManager.swift
//  Health Kit Sample
//
//  Created by Siddharth Kothari on 16/08/23.
//

import Foundation
import HealthKit

class HealthKitManager {
    func setupHealthRequest(healthStore: HKHealthStore, readSteps: @escaping () -> Void) {
        if HKHealthStore.isHealthDataAvailable(), let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount) {
            healthStore.requestAuthorization(toShare: [stepCount], read: [stepCount]) { success, error in
                if success {
                    readSteps()
                }
                else if error != nil {
                    print("Error occured while stepCount: \(String(describing: error?.localizedDescription))")
                }
            }
        }
    }
    
    // HKHealthStore.isHealthDataAvailable() checks whether Health is available on the device.
    // specify the data that we want to get — that is the step count using HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) and unwrap it using if let.
    // After I specify the data, then we call the function requestAuthorization(). This will trigger the Health app permission popup that will ask you to give permission. We also specify step count as the data to write and read. Afterward, if the user gives their permission, we will read the step count, otherwise, handle the error.
}
