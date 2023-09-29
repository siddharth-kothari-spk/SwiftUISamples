//
//  ContentView.swift
//  Published usage sample
//
//  Created by Siddharth Kothari on 29/09/23.
//

// https://medium.com/swiftly-engineered-ios/how-to-use-published-in-swiftui-6c796831ee51

// Published is a property wrapper that allows you to mark a property of a class as observable, meaning that any changes to its value will trigger an update in the views that depend on it. This is useful for creating reactive and dynamic user interfaces with SwiftUI.

import SwiftUI

struct ContentView: View {
    var body: some View {
        CounterView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
