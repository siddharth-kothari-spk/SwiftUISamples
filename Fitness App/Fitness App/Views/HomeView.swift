//
//  HomeView.swift
//  Fitness App
//
//  Created by Siddharth Kothari on 18/08/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var healthManager: HealthManager
    let welcomeArray = ["welcome", "bienvenida", "bienvenido"]
    @State private var currentIndex = 1
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(welcomeArray[currentIndex])
                .font(.largeTitle)
                .padding()
                .foregroundColor(.secondary)
                .onAppear {
                    startWelcomeTimer()
                }
            
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                ForEach(healthManager.mockActivities.sorted(by: { $0.value.id < $1.value.id}), id:\.key) { item in
                    ActivityCard(activity: item.value)
                }
            }
            .padding(.horizontal)
        }
        .frame(width: .infinity, height: .infinity, alignment: .top)
    }
    
    func startWelcomeTimer() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % welcomeArray.count
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(HealthManager())
    }
}
