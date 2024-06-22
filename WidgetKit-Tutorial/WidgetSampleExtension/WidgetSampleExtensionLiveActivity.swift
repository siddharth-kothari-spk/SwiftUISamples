//
//  WidgetSampleExtensionLiveActivity.swift
//  WidgetSampleExtension
//
//  Created by Siddharth Kothari on 22/06/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetSampleExtensionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetSampleExtensionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetSampleExtensionAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetSampleExtensionAttributes {
    fileprivate static var preview: WidgetSampleExtensionAttributes {
        WidgetSampleExtensionAttributes(name: "World")
    }
}

extension WidgetSampleExtensionAttributes.ContentState {
    fileprivate static var smiley: WidgetSampleExtensionAttributes.ContentState {
        WidgetSampleExtensionAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetSampleExtensionAttributes.ContentState {
         WidgetSampleExtensionAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetSampleExtensionAttributes.preview) {
   WidgetSampleExtensionLiveActivity()
} contentStates: {
    WidgetSampleExtensionAttributes.ContentState.smiley
    WidgetSampleExtensionAttributes.ContentState.starEyes
}
