//
//  WelcomeView.swift
//  WeatherDemo
//
//  Created by Siddharth Kothari on 27/07/24.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // to capture entire screen
    }
}

#Preview {
    WelcomeView()
}
