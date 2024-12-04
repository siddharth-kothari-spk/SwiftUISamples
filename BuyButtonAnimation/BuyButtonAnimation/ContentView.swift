//
//  ContentView.swift
//  BuyButtonAnimation
//
//  Created by Siddharth Kothari on 04/12/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-buy-button-animation-activity-7269309349510938625-GF6q/?utm_source=share&utm_medium=member_desktop
import SwiftUI

struct ContentView: View {
    @State var spin = false
    @State var start = false
    @State var loading = false
    @State var currentIconIndex = 0
    @State var showCheckmark = false
    @State var icons = ["gift.fill", "cart.fill", "bag.fill", "creditcard.fill", "tag.fill", "bag.fill"]
    
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
