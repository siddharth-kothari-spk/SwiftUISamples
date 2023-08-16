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
    
    
    func readStepCount(forToday: Date, healthStore: HKHealthStore, completion: @escaping (Double) -> Void) {
        // specify the stepQuantityType as the data that we want to read from HealthKit
        guard let stepQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return  }
        
        // prepare a date as a predicate to read today’s step count data. After I specify the date, I add a predicate with the option .strictStartDate which means that the data that I read must be within the time range specified so I get the exact today’s step count data.
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        
        let preicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        // next thing is a query, I use options .cumulativeSum to calculate the sum of all steps recorded in a day, because if you open Health and go into steps, you could see that the steps are recorded by the hour, so we need to sum all of it to get the total step count.
        let query = HKStatisticsQuery(quantityType: stepQuantityType, quantitySamplePredicate: preicate, options: .cumulativeSum) { query, result, error in
            // After unwrapping the result value, we return the completion with the sum of the step count converted into a double value.
            guard let result = result , let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            
            completion(sum.doubleValue(for: HKUnit.count()))
        }
        // execute the query using healthStore.execute(query).
        healthStore.execute(query)
    }
}
