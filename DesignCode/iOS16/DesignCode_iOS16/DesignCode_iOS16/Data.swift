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
}

var navigationItems = [
    NavigationItem(title: "Trash", icon: "trash"),
    NavigationItem(title: "Pencil", icon: "pencil"),
    NavigationItem(title: "Eraser", icon: "eraser"),
    NavigationItem(title: "Lasso", icon: "lasso"),
    NavigationItem(title: "Folder", icon: "folder")
]
