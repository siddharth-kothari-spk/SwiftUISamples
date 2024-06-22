//
//  WidgetSampleExtensionBundle.swift
//  WidgetSampleExtension
//
//  Created by Siddharth Kothari on 22/06/24.
//

import WidgetKit
import SwiftUI

@main
struct WidgetSampleExtensionBundle: WidgetBundle {
    var body: some Widget {
        WaterTips_Widget_Extension()
        WidgetSampleExtensionLiveActivity()
    }
}
