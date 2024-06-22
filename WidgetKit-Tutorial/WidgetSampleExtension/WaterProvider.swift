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
struct WaterProvider {
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

extension WaterProvider: TimelineProvider {
    // 1.
        func placeholder(in context: Context) -> WaterEntry {
            return placeholderEntry
        }
        
        // 2.
        func getSnapshot(in context: Context, completion: @escaping (WaterEntry) -> ()) {
            completion(placeholderEntry)
        }
        
        // 3.
        func getTimeline(in context: Context, completion: @escaping (Timeline<WaterEntry>) -> Void) {
            let currentDate = Date()
            var entries : [WaterEntry] = []
            
            for minuteOffset in 0 ..< 60 {
                let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
                let tip = waterTips.tipsList[Int.random(in: 0...waterTips.tipsList.count-1)]
                let entry = WaterEntry(date: entryDate, waterTip: tip)
                entries.append(entry)
            }
            
            let timeline = Timeline(entries: entries, policy: .atEnd)
            
            completion(timeline)
        }
}

/*
 The placeholder(in:) function is used to show a generic visual representation of the widget with no specific content. This can be called when the widget is loading at startup, for example
 To show your widget in the widget gallery, WidgetKit asks the timeline provider for a preview snapshot that displays generic data. WidgetKit makes this request by calling the function getSnapshot(in:completion:)
 WidgetKit calls getTimeline(in:completion:) to request the timeline from the provider

A timeline consists of one or more timeline entries and of an object of type TimelineReloadPolicy that informs WidgetKit when to request the next entry of the timeline. On the code above, the reload policy is set as .atEnd. It means that the widget requests a new timeline entry after the date of the previous timeline entry passes.

With this implementation, a new entry will be provided by the timeline every one minute.
 */
