//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Siddharth Kothari on 23/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: Response?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your current location: \(location.latitude), \(location.longitude)")
                
                if let weather = weather {
                    Text("Weather data fetched")
                }
                else {
                    LoadingView()
                        .task {
                            do {
                               weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }
                            catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }
            else {
                if locationManager.isLoading {
                    LoadingView()
                }
                else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
           
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
