//
//  WaterEntry.swift
//  WidgetKit-Tutorial
//
//  Created by Siddharth Kothari on 22/06/24.
//

import Foundation

// 1.
import WidgetKit

// 2.
struct WaterEntry: TimelineEntry {
    // 3.
    let date: Date
    let waterTip: String
}
/*
 Import the WidgetKit framework
 Create a new struct named WaterEntry that conforms to the TimelineEntry protocol
 Add the properties date and watertip as variables of the type Date and String, respectively

In this case, the date property will tell the system when to update the widget while the waterTip property will represent the single tip in our widget.
 */
