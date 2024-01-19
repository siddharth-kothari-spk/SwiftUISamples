//
//  Test_iOS_NotificationApp.swift
//  Test iOS Notification
//
//  Created by Siddharth Kothari on 19/01/24.
//

import SwiftUI

@main
struct Test_iOS_NotificationApp: App {
    // Step 4. Connect the `AppDelegate` class to the SwiftUI app’s lifecycle
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/* via terminal
 
 Simulator identifier: 94FE4029-4410-4D6A-BBB9-EFBDBEB73DD6
 Bundle identifier: com.siddharthkothari.Test-iOS-Notification
 Payload path: /Users/siddharthkothari/Documents/TestProjects/SwiftUISamples/Test iOS Notification/Test iOS Notification/AlertPushNotification.apns
 
 run on terminal:
 xcrun simctl push "Simulator identifier" "Bundle identifier" "Payload path"
 */
