//
//  AppIntent.swift
//  WidgetKit-Tutorial
//
//  Created by Siddharth Kothari on 22/06/24.
//

import Foundation
import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}
