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
