//
//  ProtocolOrientedDashboard.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 30/08/25.
//

import SwiftUI

// Create a proper type-erased wrapper for DashboardWidget
struct AnyDashboardWidget: View {
    private let _body: () -> AnyView
    private let _widgetId: String
    private let _title: String
    private let _priority: Int
    private let _category: WidgetCategory
    
    init<T: DashboardWidget>(_ widget: T) {
        self._body = { AnyView(widget) }
        self._widgetId = widget.widgetId
        self._title = widget.title
        self._priority = widget.priority
        self._category = widget.category
    }
    
    var body: some View {
        _body()
    }
    
    var widgetId: String { _widgetId }
    var title: String { _title }
    var priority: Int { _priority }
    var category: WidgetCategory { _category }
}

// Improved protocol without View conformance issues
protocol DashboardWidget: View {
    var widgetId: String { get }
    var title: String { get }
    var priority: Int { get }
    var category: WidgetCategory { get }
    
    func configure(with data: WidgetData) -> Self
}

enum WidgetCategory: String, CaseIterable {
    case analytics = "Analytics"
    case social = "Social"
    case finance = "Finance"
    case weather = "Weather"
    case productivity = "Productivity"
    
    var iconName: String {
        switch self {
        case .analytics: return "chart.bar.fill"
        case .social: return "person.3.fill"
        case .finance: return "dollarsign.circle.fill"
        case .weather: return "cloud.sun.fill"
        case .productivity: return "checklist"
        }
    }
    
    var color: Color {
        switch self {
        case .analytics: return .blue
        case .social: return .orange
        case .finance: return .green
        case .weather: return .cyan
        case .productivity: return .purple
        }
    }
}

struct WidgetData {
    let id: String
    let content: [String: Any]
    let lastUpdated: Date
    
    static let empty = WidgetData(id: "", content: [:], lastUpdated: Date())
}

struct ProtocolOrientedDashboard: View {
    @State private var widgets: [AnyDashboardWidget] = []
    @State private var selectedCategory: WidgetCategory? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Protocol Oriented Dashboard Solution")
                .font(.title2)
                .fontWeight(.bold)
            
            categoryPicker()
            
            if filteredWidgets.isEmpty {
                emptyStateView()
            } else {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 16) {
                    ForEach(filteredWidgets.indices, id: \.self) { index in
                        let widget = filteredWidgets[index]
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(widget.title)
                                    .font(.headline)
                                Spacer()
                                Text("Priority: \(widget.priority)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            // The type-erased widget renders here
                            widget
                        }
                        .padding()
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(12)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            setupWidgets()
        }
    }
    
    private var filteredWidgets: [AnyDashboardWidget] {
        if selectedCategory != nil {
            widgets.filter { widget in
                widget.category == selectedCategory
            }
        }
        else {
            widgets
        }
    }
    
    @ViewBuilder
    private func categoryPicker() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                CategoryButton(
                    title: "All",
                    iconName: "square.grid.2x2",
                    color: .gray,
                    isSelected: selectedCategory == nil
                ) {
                    selectedCategory = nil
                }
                
                ForEach(WidgetCategory.allCases, id: \.self) { category in
                    CategoryButton(
                        title: category.rawValue,
                        iconName: category.iconName,
                        color: category.color,
                        isSelected: selectedCategory == category
                    ) {
                        selectedCategory = category
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func emptyStateView() -> some View {
        VStack(spacing: 16) {
            Image(systemName: "rectangle.3.group")
                .font(.largeTitle)
                .foregroundColor(.gray)
            Text("No widgets available")
                .font(.headline)
                .foregroundColor(.secondary)
            Button("Add Widget") {
                // Add widget action
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    private func setupWidgets() {
        widgets = [
            AnyDashboardWidget(SocialDashboardWidget()),
            AnyDashboardWidget(WeatherDashboardWidget()),
            AnyDashboardWidget(ProductivityWidget()),
            AnyDashboardWidget(AnalyticsDashboardWidget()),
            AnyDashboardWidget(FinanceDashboardWidget())
        ]
    }
}

struct CategoryButton: View {
    let title: String
    let iconName: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: iconName)
                    .font(.caption)
                Text(title)
                    .font(.caption)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                isSelected ? color.opacity(0.2) : Color.gray.opacity(0.1)
            )
            .foregroundColor(isSelected ? color : .primary)
            .cornerRadius(20)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SocialDashboardWidget: DashboardWidget {
    let widgetId = "social-widget"
        let title = "Social Feed"
        let priority = 3
        let category = WidgetCategory.social
        
        @State private var notifications = 8
        @State private var messages = 3
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Notifications")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("\(notifications)")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Messages")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("\(messages)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
            }
            
            HStack {
                Image(systemName: "bell.fill")
                    .foregroundColor(.orange)
                Text("Recent activity")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text("2m ago")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    func configure(with data: WidgetData) -> SocialDashboardWidget {
        return self
    }
}
struct FinanceDashboardWidget: DashboardWidget {
    let widgetId = "finance-widget"
    let title = "Portfolio"
    let priority = 4
    let category = WidgetCategory.finance
    
    @State private var portfolioValue = "$12,450"
    @State private var dayChange = "+$234"
    @State private var isPositive = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Portfolio Value")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text("Today")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            HStack {
                Text(portfolioValue)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text(dayChange)
                    .font(.subheadline)
                    .foregroundColor(isPositive ? .green : .red)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background((isPositive ? Color.green : Color.red).opacity(0.1))
                    .cornerRadius(4)
            }
            
            // Simple trend line
            HStack(alignment: .bottom, spacing: 1) {
                ForEach(0..<12, id: \.self) { _ in
                    Rectangle()
                        .fill(Color.green.opacity(0.6))
                        .frame(width: 3, height: CGFloat.random(in: 8...20))
                }
            }
        }
    }
    
    func configure(with data: WidgetData) -> FinanceDashboardWidget {
        return self
    }
}

struct ProductivityWidget: DashboardWidget {
    let widgetId = "productivity-widget"
    let title = "Today's Tasks"
    let priority = 5
    let category = WidgetCategory.productivity
    
    @State private var completedTasks = 3
    @State private var totalTasks = 7
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Progress")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(completedTasks)/\(totalTasks)")
                    .font(.caption)
                    .fontWeight(.medium)
            }
            
            // Progress bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(Color.purple)
                        .frame(
                            width: geometry.size.width * (Double(completedTasks) / Double(totalTasks)),
                            height: 8
                        )
                        .cornerRadius(4)
                        .animation(.easeInOut, value: completedTasks)
                }
            }
            .frame(height: 8)
            
            Text("\(totalTasks - completedTasks) tasks remaining")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
    
    func configure(with data: WidgetData) -> ProductivityWidget {
        return self
    }
}

struct WeatherDashboardWidget: DashboardWidget {
    let widgetId = "weather-widget"
    let title = "Weather"
    let priority = 1
    let category = WidgetCategory.weather
    
    @State private var temperature = 72
    @State private var condition = "Sunny"
    @State private var location = "San Francisco"
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(temperature)°F")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(condition)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "sun.max.fill")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
            }
            
            HStack {
                Image(systemName: "location")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(location)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
    }
    
    func configure(with data: WidgetData) -> WeatherDashboardWidget {
        // Configuration logic here
        return self
    }
}

struct AnalyticsDashboardWidget: DashboardWidget {
    let widgetId = "analytics-widget"
    let title = "Analytics"
    let priority = 2
    let category = WidgetCategory.analytics
    
    @State private var visitors = 1247
    @State private var growth = "+12.5%"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Visitors")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Text(growth)
                    .font(.caption)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color.green.opacity(0.2))
                    .foregroundColor(.green)
                    .cornerRadius(4)
            }
            
            Text("\(visitors)")
                .font(.title)
                .fontWeight(.bold)
            
            // Simple chart representation
            HStack(alignment: .bottom, spacing: 2) {
                ForEach(0..<7, id: \.self) { _ in
                    Rectangle()
                        .fill(Color.blue.opacity(0.7))
                        .frame(width: 8, height: CGFloat.random(in: 10...30))
                }
            }
        }
    }
    
    func configure(with data: WidgetData) -> AnalyticsDashboardWidget {
        return self
    }
}
// ============================================
// DATA SOURCE IMPLEMENTATIONS
// ============================================

struct WeatherDataSource: WidgetDataSource {
    let widgetId = "weather-data"
    let title = "Weather"
    let priority = 1
    let category = WidgetCategory.weather
    let data = WidgetData.empty
}

struct AnalyticsDataSource: WidgetDataSource {
    let widgetId = "analytics-data"
    let title = "Analytics"
    let priority = 2
    let category = WidgetCategory.analytics
    let data = WidgetData.empty
}

struct SocialDataSource: WidgetDataSource {
    let widgetId = "social-data"
    let title = "Social"
    let priority = 3
    let category = WidgetCategory.social
    let data = WidgetData.empty
}

struct FinanceDataSource: WidgetDataSource {
    let widgetId = "finance-data"
    let title = "Finance"
    let priority = 4
    let category = WidgetCategory.finance
    let data = WidgetData.empty
}

protocol WidgetDataSource {
    var widgetId: String { get }
    var title: String { get }
    var priority: Int { get }
    var category: WidgetCategory { get }
    var data: WidgetData { get }
}

#Preview {
    ProtocolOrientedDashboard()
}
