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
                        VStack(spacing: 10, content: {
                            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.weather[0].icon)@2x.png")) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            } placeholder: {
                                ProgressView()
                            }

                            let description: String = WeatherCodes(rawValue: weather.weather[0].id)?.description ?? weather.weather[0].description
                            Text(description)
                        })
                        .frame(width: 100, alignment: .leading)
                        //Spacer()
                        Text(weather.main.temp.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    })
                    // removed forsmaller device
//                    Spacer()
//                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
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
            
            // weather specifics
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    // temp
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble() + "°")
                    }
                    //
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value:  weather.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                    }
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundStyle(Color(hue: 0.633, saturation: 0.406, brightness: 0.741))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .ignoresSafeArea(.keyboard)
        .background(Color(hue: 0.633, saturation: 0.406, brightness: 0.741))
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
