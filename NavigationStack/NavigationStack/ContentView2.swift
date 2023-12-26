//
//  ContentView2.swift
//  NavigationStack
//
//  Created by Siddharth Kothari on 26/12/23.
//

import SwiftUI

// Like any other modifier you can use more than one navigationDestination modifier on a given view. For example, if we wanted to display two different kinds of lists on the same screen, and have our navigation automatically know how to navigate to each one, we can update our list similar to the example below. Here our navigationDestination modifiers are listening for clicks on both the DataModel type and the String type for the case of displaying the people who have had a large influence in and around the Swift industry.

struct ContentView2: View {
    var swiftInfluencers = ["Paul Hudson", "Sean Allen", "Chris Ching", "Vincent Pradeilles", "Dave Verwer", "Antoine van der Lee", "John Sundell", "and many more"]
        
        var body: some View {
            NavigationStack {
                VStack {
                    FirstScreen(items: SampleData.firstScreenData, selectedItem: "First Screen")
                    List {
                        ForEach(swiftInfluencers, id: \.self) { influencer in
                            NavigationLink(value: influencer) {
                                Text(influencer)
                            }
                        }
                    }
                }
                .navigationDestination(for: DataModel.self) { item in
                    LastScreen(items: SampleData.lastScreenData, selectedItem: item.text)
                }
                .navigationDestination(for: String.self) { item in
                    Text(item)
                }
            }
        }
}

#Preview {
    ContentView2()
}
