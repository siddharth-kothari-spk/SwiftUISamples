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
