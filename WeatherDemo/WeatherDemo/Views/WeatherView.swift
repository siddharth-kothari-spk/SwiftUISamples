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
            VStack(content: {
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today: \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.medium)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            })
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .ignoresSafeArea(.keyboard)
        .background(Color(hue: 0.633, saturation: 0.406, brightness: 0.741)
        )
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
