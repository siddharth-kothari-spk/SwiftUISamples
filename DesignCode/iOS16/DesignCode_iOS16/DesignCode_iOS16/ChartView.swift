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
            BarMark(x: .value("Day", "Sept 11"), y: .value("Value", 50))
            BarMark(x: .value("Day", "Sept 12"), y: .value("Value", 40))
            BarMark(x: .value("Day", "Sept 13"), y: .value("Value", 70))
        }
        .foregroundStyle(.linearGradient(colors: [.orange, .red, .yellow, .green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
        .frame(height: 300)
    }
}

#Preview {
    ChartView()
}
