//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by Siddharth Kothari on 28/07/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: Response
    var body: some View {
        ZStack(alignment: .leading) {
            
        }
        .ignoresSafeArea(.container)
        .background(Color(hue: 0.633, saturation: 0.406, brightness: 0.741)
        )
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
