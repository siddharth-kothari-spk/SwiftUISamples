//
//  Fitness_AppApp.swift
//  Fitness App
//
//  Created by Siddharth Kothari on 18/08/23.
//

import SwiftUI

@main
struct Fitness_AppApp: App {
    @StateObject var healthManager = HealthManager()
    var body: some Scene {
        WindowGroup {
            BeActiveTabView().environmentObject(healthManager)
        }
    }
}
