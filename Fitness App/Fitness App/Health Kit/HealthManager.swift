//
//  HealthManager.swift
//  Fitness App
//
//  Created by Siddharth Kothari on 18/08/23.
//

import Foundation
import HealthKit

class HealthManager: ObservableObject {
 
    let healthStore = HKHealthStore()
    
    init() {
        let steps = HKQuantityType(.stepCount)
        
        let healthTypes : Set = [steps]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
            } catch {
                print("error in fetching health data: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOftheDay, end: Date())
        let query = HKStatisticsQuery.init(quantityType: steps, quantitySamplePredicate: predicate) { query, stats, error in
            guard let stats = stats,let quantity = stats.sumQuantity(), error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            let stepCount = quantity.doubleValue(for: .count())
            print("steps: \(stepCount)")
        }
        healthStore.execute(query)
    }
}
