//
//  LogicOnlyOnceOnViewAppearApp.swift
//  LogicOnlyOnceOnViewAppear
//
//  Created by Siddharth Kothari on 09/10/23.
//

// https://holyswift.app/triggering-an-action-only-first-time-a-view-appears-in-swiftui/

// The Problem – Triggering an Action Only First Time a View Appears in SwiftUI

// Using UIKit we have an easy moment that we can use to run that type of code. The view lifecycle in UIKit had a step where it would load a view for the first time, and that step happened just one time until the view was completely deallocated. And you had two callbacks that you could use to do that: loadView and viewDidLoad.

/*
 SwiftUI view lifecycles. And they are: onAppear, onDisappear and task.
  
 1.Every Time The View Appears – onAppear

 onAppear marks the point in a view’s lifecycle when it has been added to the view hierarchy and is now visible to the user. This lifecycle method provides an opportunity for developers to perform tasks such as initiating network requests, starting animations, or updating the state of the view. It’s important to note that onAppear can be called multiple times during a view’s lifecycle, such as when it becomes visible after being temporarily obscured by another view.

  
 
 
 2.Every Time The View Disappears – onDisappear

 onDisappear is called when a view is removed from the view hierarchy, making it no longer visible on the screen. Developers can use this lifecycle method to perform cleanup tasks, stop animations, or release resources that were allocated when the view appeared. Like onAppear, this method can be triggered multiple times during the lifespan of a view, especially in complex view hierarchies or when views are reused.
 
 
 
 3.Every Time The View Appears and You Have an Async Task – task
 
 We have two main tasks APIs, with and without ID parameters. And the ID is used to have more control over how many times you will trigger the task itself.

 The task(id:priority:_:) modifier in SwiftUI provides a way for developers to initiate asynchronous operations in conjunction with a view’s lifecycle. By attaching this modifier to a view, tasks can be started when the view appears and automatically canceled when the view disappears, simplifying resource management and ensuring a tight coupling of a view’s lifecycle to its associated operations.

 If you use the API with id parameter you have even more control over the task that will run. The id parameter allows for the identification of the task, ensuring that a new task won’t be started unless the identifier changes. Meanwhile, the priority parameter can be used to influence the order of task execution when multiple tasks compete for limited system resources.

 This integration of asynchronous tasks directly within the SwiftUI view lifecycle streamlines the process of fetching data, running computations, and other background tasks that need to be closely tied to the UI’s presentation state
 */
import SwiftUI

@main
struct LogicOnlyOnceOnViewAppearApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
