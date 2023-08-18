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
                ActivityCard(activity: Activity(id: 1, title: "Daily Steps", subTitle: "Goal: 10000", image: "figure.walk", amount: "1234"))
                ActivityCard(activity: Activity(id: 1, title: "Daily Steps", subTitle: "Goal: 10000", image: "figure.walk", amount: "1234"))
            }
        }
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
