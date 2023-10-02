//
//  ContentView.swift
//  SF Symbols animation
//
//  Created by Siddharth Kothari on 02/10/23.
//

// courtsey: https://blorenzop.medium.com/how-to-animate-sf-symbols-in-swiftui-c3b504af4f44
// From iOS 17, Swift introduced a new modifier symbolEffect to perform pre-defined animations over SF Symbols.

// We have seven built-in animations available to apply to any SF Symbol: Bounce, Pulse, Variable Color, Scale, Appear, Disappear, Replace
/*
 All animations are grouped into four types of behaviors

     Discrete: the animation runs one time and ends.
     Indefinite: the animation will continue until we remove it or disable it.
     Transition: animate a symbol in or out of the view.
     Content Transition: for animating a replacement of one symbol with another.
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DiscreteView().tabItem {
                Label("Discrete", systemImage: "square.and.arrow.up")
            }
            IndefiniteView().tabItem {
                Label("Indefinite", systemImage: "square.and.arrow.up.circle")
            }
            TransitionView().tabItem {
                Label("Transition", systemImage: "square.and.arrow.down")
            }
            ContentTransitionView().tabItem { Label("Content Transition", systemImage: "square.and.arrow.up.on.square") }
        }
    }
}

#Preview {
    ContentView()
}
