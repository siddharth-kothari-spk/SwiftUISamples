//
//  ContentView.swift
//  CircleAnimation
//
//  Created by Siddharth Kothari on 24/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-iosdeveloper-swift-activity-7266040505233215488-NXCj/?utm_source=share&utm_medium=member_desktop

import SwiftUI

struct ContentView: View {
    let outerIcons = ["square.and.arrow.up", "pencil.circle.fill", "scribble.variable", "pencil.tip.crop.circle.fill", "paperplane.circle.fill", "externaldrive.fill.badge.timemachine", "doc.zipper", "pencil.and.list.clipboard.rtl", "doc.text.magnifyingglass", "apple.terminal.on.rectangle.fill"]
    
    @State var degrees: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            ForEach(0..<outerIcons.count, id: \.self) { index in
                VStack {
                    Image(systemName: outerIcons[index])
                        .font(.title)
                        .symbolRenderingMode(.multicolor)  /// Sets the rendering mode for symbol images within this view.
                }
                .circularPosition(index: index, totalCount: outerIcons.count, radius: 150)
            }
        }
    }
}

#Preview {
    ContentView()
}
