//
//  HomeView.swift
//  Fitness App
//
//  Created by Siddharth Kothari on 18/08/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var healthManager: HealthManager
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                ForEach(healthManager.activities.sorted(by: { $0.value.id < $1.value.id}), id:\.key) { item in
                    ActivityCard(activity: item.value)
                    
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            healthManager.fetchTodaySteps()
            healthManager.fetchTodayCalories()
    }
    }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
