//
//  LegitimateAnyViewExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

// ✅ APPROPRIATE: When you need truly different view types
enum ViewType {
    case chart, table, grid
}

struct DataPoint {
    let x: Double
    let y: Double
}

struct LegitimateAnyViewExample: View {
    @State private var viewType: ViewType = .chart
    let data: [DataPoint]
    
    var body: some View {
        VStack {
            Picker("View Type", selection: $viewType) {
                Text("Chart").tag(ViewType.chart)
                Text("Table").tag(ViewType.table)
                Text("Grid").tag(ViewType.grid)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // This is appropriate AnyView usage because we're returning
            // completely different view types that can't be unified
            dynamicContent()
        }
    }
    
    func dynamicContent() -> AnyView {
        switch viewType {
        case .chart:
            return AnyView(ChartView(data: data).background(.red))
        case .table:
            return AnyView(TableView(data: data).background(.blue))
        case .grid:
            return AnyView(GridView(data: data).background(.green))
        }
    }
}

#Preview {
    LegitimateAnyViewExample(data: [DataPoint(x: 1.0, y: 2.0)])
}

struct ChartView: View {
    let data: [DataPoint]
    var body: some View { Text("Chart View") }
}

struct TableView: View {
    let data: [DataPoint]
    var body: some View { Text("Table View") }
}

struct GridView: View {
    let data: [DataPoint]
    var body: some View { Text("Grid View") }
}
