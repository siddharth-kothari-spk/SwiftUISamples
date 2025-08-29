//
//  ViewFactoryAnyViewExample.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

struct ViewFactoryAnyViewExample: View {
    var body: some View {
        VStack {
            ViewFactory.createDashboardWidget(type: .calendar)
            Spacer().frame(height: 20)
            
            ViewFactory.createDashboardWidget(type: .news)
            Spacer().frame(height: 20)
            
            ViewFactory.createDashboardWidget(type: .stocks)
            Spacer().frame(height: 20)
            
            ViewFactory.createDashboardWidget(type: .weather)
        }
    }
}

struct ViewFactory {
    static func createDashboardWidget(type: WidgetType) -> AnyView {
        switch type {
        case .weather:
            return AnyView(WeatherWidget())
        case .stocks:
            return AnyView(StocksWidget())
        case .news:
            return AnyView(NewsWidget())
        case .calendar:
            return AnyView(CalendarWidget())
        }
    }
}

enum WidgetType {
    case weather, stocks, news, calendar
}

struct WeatherWidget: View {
    var body: some View { Text("Weather Widget") }
}

struct StocksWidget: View {
    var body: some View { Text("Stocks Widget") }
}

struct NewsWidget: View {
    var body: some View { Text("News Widget") }
}

struct CalendarWidget: View {
    var body: some View { Text("Calendar Widget") }
}
#Preview {
    ViewFactoryAnyViewExample()
}
