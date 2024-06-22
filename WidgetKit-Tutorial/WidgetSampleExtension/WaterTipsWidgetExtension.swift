//
//  WaterTipsWidgetExtension.swift
//  WidgetKit-Tutorial
//
//  Created by Siddharth Kothari on 22/06/24.
//

import Foundation
// 1.
import WidgetKit
import SwiftUI

// 2.
@main
struct WaterTips_Widget_Extension: Widget {
    // 3.
    let kind: String = "Create-With-Swift-Example_Widget"
    var body: some WidgetConfiguration {
        
        // 4.
        StaticConfiguration(
            kind: kind,
            provider: WaterProvider(),
            content: { WaterWidgetView(entry: $0) }
        )
        // 5.
        .configurationDisplayName("Water tips")
        // 6.
        .description("Some little tips about water that will change your life!")
        // 7.
        .supportedFamilies([
            .systemMedium,
            .systemLarge
        ])
    }
}

/*
 Importing SwiftUI and WidgetKit
 Creating a new structure marked by the @main tag to indicate this struct as the entry point of the widget target
 Define a kind variable. It will serve as an identifier for the widget
 The StaticConfiguration is an object describing the content of a widget it requires:
     kind: a unique string to identify the widget
     provider: an object that determines the timing of updates to the widget's view
     content: a view that renders the widget
 Sets the localized name shown for a widget when a user adds or edits the widgets in the widget gallery
 Set the localized description shown in the widget gallery
 The supported sizes of the Widget , you can find all the widget families in the documentation of WidgetFamily.

In this case, we are using the StaticConfiguration object because this widget has no user-configurable options. If your application requires a user-configurable option, like in the Stocks app which allows the user to choose which stocks to show in the widget, use IntentConfiguration.
 */
