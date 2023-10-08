//
//  ContentView.swift
//  Accessing User Location
//
//  Created by Siddharth Kothari on 08/10/23.
//

// courtsey: https://holyswift.app/the-new-way-to-get-current-user-location-in-swiftu-tutorial/

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @State var oldLocationManager = OldLocationManager()
    @State var newLocationManager = NewLocationManager()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            Text("Old Location Manager: \(oldLocationManager.location?.description ?? "No Location")")
            Text("New Location Manager: \(newLocationManager.location?.description ?? "No Location")")
        }
        .padding()
        .task {
           try? await oldLocationManager.requestUserAuthorization()
            oldLocationManager.startCurrentLocationUpdates()
        }
        .task {
            try? await newLocationManager.requestUserAuthorization()
            try? await newLocationManager.startCurrentLocationUpdates()
        }
    }
}

#Preview {
    ContentView()
}
