//
//  ContentView.swift
//  NavigationSplitView
//
//  Created by Siddharth Kothari on 27/12/23.
//

// courtsey: https://medium.com/@jpmtech/swiftui-navigationsplitview-30ce87b5de03
/*
 NavigationSplitView is a component that allows users on larger devices such as iPhone Pro Max (only in Landscape mode), iPad, Mac, and Apple TV to see more more details at once, specifically around navigation. While NavigationSplitView may look great on larger screens, it also works well on smaller screens. For example, on an iPad (in slide over mode), an iPhone SE or an Apple Watch, the extra details of the navigation are hidden away and automagically work like a regular single column NavigationStack.
 
 Apple gives us two different configurations by default. The first is a two column layout, and the second is a three column layout. I say “by default” here because you can embed a NavigationStack in the NavigationSplitView so you don’t have to fit all of your navigation into only three views.
 
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        ThreeColumnSampleCode()
    }
}

#Preview {
    ContentView()
}
