//
//  RotateCircleAroundCircle.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

/*
 This loader is very interesting. Create the following properties in this View first.

     angle: will control the angle of the small circle on a stroke circle
     timeInterval: will be used inside the Timer to specify the interval of the timer.
     size: is the size of the stroke circle

     Timer will run block code after every given interval

 Now, create a circle with a given size and apply stroke and frame. Now, apply overlay on it and create a RoundedRectangle with cornerRadius and frame and these two properties make the rectangle in circle. You can use the Circle as well.

 Now, apply the offset on that RoundedRectangle. You need to specify the offset on both x and y axes to move that RoundedRectangle for that you need to use cos and sin functions which will calculate the values based on the angle value.

     x: size/2 * CGFloat(cos(angle)) this will give the xOffset to the edge of the circle

     y: size/2 * CGFloat(sin(angle)) this will give the yOffset to the edge of the circle

 Now, onAppear runs a timer that will update the angle by adding 0.1
 */
import SwiftUI

struct RotateCircleAroundCircle: View {
    @State private var angle: Double = 0
    var timeInterval: TimeInterval = 0.1
    var size: CGFloat = 80

    var body: some View {
        VStack {
            Circle()
                .stroke(.black, lineWidth: 2)
                .frame(width: size, height: size)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 10, height: 10)
                        .offset(
                            x: size/2 * CGFloat(cos(angle)),
                            y: size/2 * CGFloat(sin(angle))
                        )
                )
        }
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { _ in
                withAnimation {
                    angle += 0.1
                }
            }
            RunLoop.current.add(timer, forMode: .common)
        }
    }
}

#Preview {
    RotateCircleAroundCircle()
}
