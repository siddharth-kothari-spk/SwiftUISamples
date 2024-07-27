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
            VStack(spacing: 20, content: {
                Text("Welcome to Weather App").bold().font(.title)
                
                Text("Please share your current location to get weather details")
                    .padding()
            })
            .multilineTextAlignment(.center)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // to capture entire screen
    }
}

#Preview {
    WelcomeView()
}
