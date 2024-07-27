//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Siddharth Kothari on 23/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            WelcomeView().environmentObject(locationManager)
        }
        .background(Color(hue: 0.633, saturation: 0.406, brightness: 0.741)
        )
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

#Preview {
    ContentView()
}
