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
    
    @Published var activities: [String: Activity] = [:]
    
    @Published var mockActivities: [String: Activity] = [
        "todaySteps": Activity(id: 0, title: "Daily Steps", subTitle: "Goal: 10000", image: "figure.walk", amount: "8999"),
        "todayCalories": Activity(id: 1, title: "Today calories", subTitle: "Goal: 1000", image: "flame", amount: "400")
    ]
    
    init() {
        let steps = HKQuantityType(.stepCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        let workout = HKObjectType.workoutType()
        
        let healthTypes : Set = [steps, calories, workout]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                fetchTodaySteps()
                fetchTodayCalories()
                fetchWorkoutWeekData()
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
            let activity = Activity(id: 0, title: "Daily Steps", subTitle: "Goal: 10000", image: "figure.walk", amount: stepCount.formatToString()!)
            DispatchQueue.main.async {
                self.activities["todaySteps"] = activity
            }
            print("steps: \(stepCount)")
        }
        healthStore.execute(query)
    }
    
    func fetchTodayCalories() {
        let steps = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOftheDay, end: Date())
        let query = HKStatisticsQuery.init(quantityType: steps, quantitySamplePredicate: predicate) { query, stats, error in
            guard let stats = stats,let quantity = stats.sumQuantity(), error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            let calories = quantity.doubleValue(for: .kilocalorie())
            let activity = Activity(id: 1, title: "Today calories", subTitle: "Goal: 1000", image: "flame", amount: calories.formatToString()!)
            DispatchQueue.main.async {
                self.activities["todayCalories"] = activity
            }
            print("steps: \(calories)")
        }
        healthStore.execute(query)
    }
    
    func fetchWorkoutWeekData() {
        // we can have multiple options here to select from , daily , weekly , monthly
        let workout = HKSampleType.workoutType()
        let timePredicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let workoutPredicate = HKQuery.predicateForWorkouts(with: .running)//HKQuery.predicateForWorkoutActivities(workoutActivityType: .running)
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [timePredicate, workoutPredicate])
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: 20, sortDescriptors: nil) { _, samples, error in
            guard let workouts = samples as? [HKWorkout], error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            var count = 0
            for workout in workouts {
                let duration = Int(workout.duration)/60
                count += duration
                print(workout.allStatistics, workout.duration, workout.workoutActivities, workout.workoutActivityType, workout.workoutEvents as Any)
            }
        }
        healthStore.execute(query)
    }
}
