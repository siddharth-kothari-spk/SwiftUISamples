//
//  ContentView.swift
//  HiddenTextAnimation
//
//  Created by Siddharth Kothari on 22/11/24.
//

// https://www.linkedin.com/posts/su-codee-676946321_swiftui-ios-iosdeveloper-activity-7264251009189707776--q9O?utm_source=share&utm_medium=member_desktop
import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        TextView(text: "Hidden Text", show: show)
            .animation(.spring.delay(1.2), value: show)
        
        TextView(text: "Animation", show: show)
            .animation(.spring.delay(1), value: show)
            .onAppear(perform: {
                show = true
            })
    }
    
}

#Preview {
    ContentView()
}
