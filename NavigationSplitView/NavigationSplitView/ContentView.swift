//
//  ContentView.swift
//  NavigationSplitView
//
//  Created by Siddharth Kothari on 27/12/23.
//

// courtsey: https://medium.com/@jpmtech/swiftui-navigationsplitview-30ce87b5de03
/*
 NavigationSplitView is a component that allows users on larger devices such as iPhone Pro Max (only in Landscape mode), iPad, Mac, and Apple TV to see more more details at once, specifically around navigation. While NavigationSplitView may look great on larger screens, it also works well on smaller screens. For example, on an iPad (in slide over mode), an iPhone SE or an Apple Watch, the extra details of the navigation are hidden away and automagically work like a regular single column NavigationStack.
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
