//
//  ContentView.swift
//  NavigationStack
//
//  Created by Siddharth Kothari on 25/12/23.
//

// courtsey: https://medium.com/@jpmtech/navigationstack-in-swiftui-d89a61bd8963

import SwiftUI

struct ContentView: View {
    var body: some View {
        // NavigationStack will lazy load the items in it’s stack, meaning they won’t be loaded into memory until they are needed, making your app more performant just by swapping out the NavigationView for NavigationStack. In a slightly more advanced configuration, it can also push and pop multiple items onto the navigation stack at once
        NavigationStack {
            VStack {
                FirstScreen(items: SampleData.firstScreenData, selectedItem: "First Screen")
            }
            .navigationDestination(for: DataModel.self) { item in
                LastScreen(items: SampleData.lastScreenData, selectedItem: item.text)
            }
            // navigationDestination modifier accepts a type in the “for” parameter. It works by listening for any clicks to happen that match the type passed in to the “for” parameter and the same type that is declared as the “value” parameter in the NavigationLink. Once a click has been detected, it passes the item that was clicked into the trailing closure of the navigationDestination modifier.
        }
    }
}

#Preview {
    ContentView()
}
