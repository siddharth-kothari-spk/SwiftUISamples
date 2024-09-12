//
//  ChartView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 12/09/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        VStack {
            Chart {
                ForEach(chartData) { item in
                    BarMark(x: .value("Day", item.xAxis), y: .value("Value", item.yAxis))
                        .cornerRadius(10)
                }
                
            }
            .foregroundStyle(.linearGradient(colors: [.orange, .red, .yellow, .green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(height: 300)
            
            Chart {
                ForEach(chartData.reversed()) { item in
                    LineMark(x: .value("Day", item.xAxis), y: .value("Value", item.yAxis), series: .value("Year", 2023))
                        .cornerRadius(10)
                        .interpolationMethod(.cardinal(tension: 0.5))
                }
                ForEach(chartData2.reversed()) { item in
                    LineMark(x: .value("Day", item.xAxis), y: .value("Value", item.yAxis), series: .value("Year", 2024))
                        .cornerRadius(10)
                        .interpolationMethod(.cardinal(tension: 0.5))
                }
            }
            .foregroundStyle(.linearGradient(colors: [.orange, .red, .yellow, .green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(height: 300)
        }
    }
}

#Preview {
    ChartView()
}


