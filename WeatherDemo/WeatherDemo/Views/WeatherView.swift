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
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2023/04/09/11/05/mountains-7911302_1280.jpg")) { image in
                            image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
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
