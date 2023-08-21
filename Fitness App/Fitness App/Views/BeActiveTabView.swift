//
//  BeActiveTabView.swift
//  Fitness App
//
//  Created by Siddharth Kothari on 18/08/23.
//

import Foundation
import SwiftUI

struct BeActiveTabView: View {
    @EnvironmentObject var healthManager: HealthManager
    @State var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView().tag("Home").tabItem {
                Image(systemName: "house")
            }.environmentObject(healthManager)
            
           /* HomeView().tag("Home2").tabItem {
                Image(systemName: "house")
            }.environmentObject(healthManager)
            */
        }
    }
    
}

struct BeActiveTabView_Previews: PreviewProvider {
    static var previews: some View {
        BeActiveTabView()
    }
}
