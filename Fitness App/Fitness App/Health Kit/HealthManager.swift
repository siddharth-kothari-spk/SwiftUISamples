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
               // fetchStrengthTrainingData()
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
            print("calories: \(calories)")
        }
        healthStore.execute(query)
    }
    
    func fetchWorkoutWeekData() {
        // we can have multiple options here to select from , daily , weekly , monthly
        let workout = HKSampleType.workoutType()
        let timePredicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let workoutPredicate = HKQuery.predicateForWorkouts(with: .running)
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [timePredicate, workoutPredicate])
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: 20, sortDescriptors: nil) { _, samples, error in
            guard let workouts = samples as? [HKWorkout],workouts.count > 0, error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            var runningCount = 0
            var strengthCount = 0
            var stairsCount = 0
            var stairClimbingCount = 0
            var walkingCount = 0
            
            for workout in workouts {
                print(workout.allStatistics, workout.duration, workout.workoutActivities, workout.workoutActivityType, workout.workoutEvents as Any)
                
                switch workout.workoutActivityType {
                case .running:
                    let duration = Int(workout.duration)/60
                    runningCount += duration
                case .traditionalStrengthTraining:
                    let duration = Int(workout.duration)/60
                    strengthCount += duration
                case .stairs:
                    let duration = Int(workout.duration)/60
                    stairsCount += duration
                case .stairClimbing:
                    let duration = Int(workout.duration)/60
                    stairClimbingCount += duration
                case .walking:
                    let duration = Int(workout.duration)/60
                    walkingCount += duration
                case .americanFootball,
                        .archery,
                        .australianFootball,
                        .badminton,
                        .baseball,
                        .basketball,
                        .bowling,
                        .boxing,
                        .climbing,
                        .cricket,
                        .crossTraining,
                        .curling,
                        .cycling,
                        .dance,
                        .danceInspiredTraining,
                        .elliptical,
                        .equestrianSports,
                        .fencing,
                        .fishing,
                        .functionalStrengthTraining,
                        .golf,
                        .gymnastics,
                        .handball,
                        .hiking,
                        .hockey,
                        .hunting,
                        .lacrosse,
                        .martialArts,
                        .mindAndBody,
                        .mixedMetabolicCardioTraining,
                        .paddleSports,
                        .play,
                        .preparationAndRecovery,
                        .racquetball,
                        .rugby,
                        .rowing,
                        .soccer,
                        .squash,
                        .sailing,
                        .softball,
                        .swimming,
                        .snowboarding,
                        .snowSports,
                        .socialDance,
                        .skatingSports,
                        .surfingSports,
                        .swimBikeRun,
                        .tableTennis,
                        .trackAndField,
                        .volleyball,
                        .waterPolo,
                        .waterSports,
                        .waterFitness,
                        .wrestling,
                        .wheelchairRunPace,
                        .wheelchairWalkPace,
                        .yoga,
                        .barre,
                        .coreTraining,
                        .crossCountrySkiing,
                        .downhillSkiing,
                        .flexibility,
                        .highIntensityIntervalTraining,
                        .jumpRope,
                        .kickboxing,
                        .pilates,
                        .taiChi,
                        .mixedCardio,
                        .handCycling,
                        .discSports,
                        .fitnessGaming,
                        .cardioDance,
                        .pickleball,
                        .cooldown,
                        .transition,
                        .tennis,
                        .stepTraining,
                        .other:
                    print("workout = \(workout.workoutActivityType.rawValue)")
                @unknown default:
                    print("unknown")
                }
                
            }
            let runningActivity = Activity(id: 2, title: "Running", subTitle: "Min this week", image: "figure.walk", amount: "\(runningCount) minutes")
            let strengthActivity = Activity(id: 3, title: "Strength Trainig", subTitle: "This week", image: "dumbbell", amount: "\(strengthCount) minutes")
            let stairActivity = Activity(id: 4, title: "Stair Activity", subTitle: "This week", image: "stairs", amount: "\(stairsCount) minutes")
            let stairClimbActivity = Activity(id: 5, title: "Stair Climb", subTitle: "This week", image: "figure.stairs", amount: "\(stairClimbingCount) minutes")
            let walkingActivity = Activity(id: 6, title: "Walking", subTitle: "This week", image: "figure.walk.motion", amount: "\(walkingCount) minutes")
            DispatchQueue.main.async {
                self.activities["weekRuning"] = runningActivity
                self.activities["strengthTraining"] = strengthActivity
                self.activities["stairActivity"] = stairActivity
                self.activities["stairClimbActivity"] = stairClimbActivity
                self.activities["walkingrActivity"] = walkingActivity
                
            }
        }
        healthStore.execute(query)
    }
    
    func fetchStrengthTrainingData() {
        // we can have multiple options here to select from , daily , weekly , monthly
        let workout = HKSampleType.workoutType()
        let timePredicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let workoutPredicate = HKQuery.predicateForWorkouts(with: .functionalStrengthTraining)
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
            let activity = Activity(id: 3, title: "Strength Trainig", subTitle: "This week", image: "dumbbell", amount: "\(count) minutes")
            DispatchQueue.main.async {
                self.activities["strengthTraining"] = activity
            }
        }
        healthStore.execute(query)
    }
}
