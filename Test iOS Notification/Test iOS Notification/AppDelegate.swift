//
//  AppDelegate.swift
//  Test iOS Notification
//
//  Created by Siddharth Kothari on 19/01/24.
//

import Foundation
import UIKit

// Step 1. Declare `UNUserNotificationCenterDelegate`
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        registerForNotifications()
        return true
    }
    
    // Step 2. Ask the user's permission to show alert notifications by calling the `requestAuthorization` method.
    func registerForNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            print("Permission granted: \(granted)")
        }
    }
    
    // Step 3. Set up registration callback functions to check whether the registration fails or succeeds and display the notification.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
    
}
