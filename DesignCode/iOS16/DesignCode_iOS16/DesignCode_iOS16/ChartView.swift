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
            BarMark(x: .value("Day", "Sept 12"), y: .value("Value", 50))
        }
    }
}

#Preview {
    ChartView()
}
