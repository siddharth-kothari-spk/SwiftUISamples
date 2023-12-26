//
//  ContentView3.swift
//  NavigationStack
//
//  Created by Siddharth Kothari on 26/12/23.
//

import SwiftUI

/*
 Using NavigationStack with the Path parameter

 Using the path parameter allows our NavigationStack to be more flexible in how we navigation across screens. In the code below we have added a State variable that holds an array of the DataModels that we have chosen to add to our path. We have also added a couple buttons outside the Stack which will allow us to jump to a specific screen with a certain set of paths that we can traverse back through one at a time, or jump all the way back to the root of the navigation stack with a single button click. The path parameter is an array of the data you traverse through as you navigate in your app. Because the path is just an array (not a scary unknown thing like I thought it was when I first saw this syntax), we can do things like add items to the array programmatically, or remove all the items from the array, to give our NavigationStack more flexibility. In the normal operation of the NavigationStack where we only move one screen at a time, the NavigationStack handles adding the items to the path for us (which is why we don’t have to write any code to move one screen at a time).
 */

struct ContentView3: View {
    @State private var path = [DataModel]()
        
        var body: some View {
            VStack {
                NavigationStack(path: $path) {
                    VStack {
                        FirstScreen(items: SampleData.firstScreenData, selectedItem: "")
                    }
                    .navigationDestination(for: DataModel.self) { item in
                        LastScreen(items: SampleData.lastScreenData, selectedItem: item.text)
                    }
                }
                
                HStack {
                    Button("Back to root") {
                        popToRoot()
                    }
                    Spacer()
                    Button("Jump to Fastest") {
                        jumpToSpecificPoint()
                    }
                }.padding()
            }
        }
        
        func jumpToSpecificPoint() {
            path = [
                SampleData.firstScreenData[1],
                SampleData.secondScreenData.last!,
                SampleData.lastScreenData.last!
            ]
        }
        
        func popToRoot() {
            path.removeAll()
        }
}

#Preview {
    ContentView3()
}
