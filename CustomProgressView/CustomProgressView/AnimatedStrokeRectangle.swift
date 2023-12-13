//
//  AnimatedStrokeRectangle.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

/*
 This is very simple stroke animation which you can put on appearing of any object stroke.

 Create trimEnd property which will be initially zero. After that create a Rectangle with stroke. Apply time property on it. Initially, trimEnd property is zero so that the Rectangle will be invisible.
 After that apply easeInOut animation on change of trimEnd value for 2 seconds durations.

 On onAppear change trimEnd value to 1.
 */
import SwiftUI

struct AnimatedStrokeRectangle: View {
    @State private var trimEnd: CGFloat = 0.0

    var body: some View {
        Rectangle()
            .trim(from: 0.0, to: trimEnd)
            .stroke(.black, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
            .frame(width: 80, height: 80)
            .animation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true)
                    , value: trimEnd
            )
            .onAppear {
                self.trimEnd = 1.0
            }
    }
}

#Preview {
    AnimatedStrokeRectangle()
}
