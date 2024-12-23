//
//  Data.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 05/09/24.
//

import Foundation

struct NavigationItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    var menu: Menu
}

var navigationItems = [
    NavigationItem(title: "Trash", icon: "trash", menu: .trash),
    NavigationItem(title: "Pencil", icon: "pencil", menu: .pencil),
    NavigationItem(title: "Eraser", icon: "eraser", menu: .eraser),
    NavigationItem(title: "Lasso", icon: "lasso", menu: .lasso),
    NavigationItem(title: "Folder", icon: "folder", menu: .folder)
]

enum Menu: String {
    case trash
    case pencil
    case eraser
    case lasso
    case folder
}


struct ChartValue: Identifiable {
    var id = UUID()
    var xAxis: String
    var yAxis: Double
}

var chartData = [
    ChartValue(xAxis: "Sept 1", yAxis: 100.0),
    ChartValue(xAxis: "Sept 2", yAxis: 80.0),
    ChartValue(xAxis: "Sept 3", yAxis: 63.0),
    ChartValue(xAxis: "Sept 4", yAxis: 109.0),
    ChartValue(xAxis: "Sept 5", yAxis: 111.0)
]

var chartData2 = [
    ChartValue(xAxis: "Sept 1", yAxis: 89.0),
    ChartValue(xAxis: "Sept 2", yAxis: 97.0),
    ChartValue(xAxis: "Sept 3", yAxis: 23.0),
    ChartValue(xAxis: "Sept 4", yAxis: 43.0),
    ChartValue(xAxis: "Sept 5", yAxis: 88.0)
]
