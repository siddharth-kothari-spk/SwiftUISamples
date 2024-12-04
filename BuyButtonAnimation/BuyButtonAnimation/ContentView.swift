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
        ZStack {
            Group {
                Circle()
                    .frame(width: 55, height: 55)
                    .foregroundStyle(AngularGradient(gradient: Gradient(colors: [.black, .yellow]), center: .center, angle: .degrees(spin ? 360 : 0)))
            }
        }
        .frame(width: start ? 65 : 190, height: 65)
        .background(.black, in: Capsule())
    }
}

#Preview {
    ContentView()
}
