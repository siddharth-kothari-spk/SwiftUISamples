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
                // Header
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today: \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.medium)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Spacer
                Spacer()
                
                // Weather detail
                VStack(content: {
                    HStack(content: {
                        VStack(spacing: 20, content: {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        })
                        .frame(width: 150, alignment: .leading)
                        Spacer()
                        Text(weather.main.temp.roundDouble() + "")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                        
                        
                    })
                })
                .frame(maxWidth: .infinity)
                
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
