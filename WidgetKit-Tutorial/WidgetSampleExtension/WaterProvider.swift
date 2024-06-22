//
//  WaterProvider.swift
//  WidgetKit-Tutorial
//
//  Created by Siddharth Kothari on 22/06/24.
//

import Foundation
// 1.
import WidgetKit

// 2.
struct WaterProvider: TimelineProvider {
        // 3.
        private let waterTips = Tips()
    // 4.
    private let placeholderEntry = WaterEntry(
        date: Date(),
        waterTip: ""
    )
}

/*
 Import WidgetKit
 Create a new struct named WaterProvider that conforms to the TimelineProvider protocol
 Create an instance of the Tips struct
 Define a placeholder entry of our widget. This entry will be the one displayed in the widget collection of the system so be sure to not insert any temporary information related to the app
 */
