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
        Chart {
            ForEach(chartData) { item in
                BarMark(x: .value("Day", item.xAxis), y: .value("Value", item.yAxis))
                    .cornerRadius(10)
            }
            
        }
        .foregroundStyle(.linearGradient(colors: [.orange, .red, .yellow, .green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
        .frame(height: 300)
    }
}

#Preview {
    ChartView()
}


