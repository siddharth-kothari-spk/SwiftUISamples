//
//  PieSegmentLoader.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

/*
 This is a very easy loader. Create a PieSegment by using the SwiftUI Path. PueSegment is getting the start and end angles and then fill those angles with the given color.

 After that create a PieSegmentLoader View. Create the following two properties in it.

     degree: will be the end angle of the PieSegment
     isFurther: will use to check that we need to forward the degree value or reverse the degree value

 Now, use the PieSegment inside the PieSegmentLoader with start angle .zero and end angle degree value. Give it some frame and apply animation on it when degree value will change.

 Now, onAppear start a timer and check is isFurther is true then add 1 into the degree and otherwise subtract the 1 into the degree.

 If the degree is equal to the 360 then isFurther will be false and if the degree is equal to the zero then the isFuther will be true.
 */
import SwiftUI

struct PieSegment: Shape {
    var start: Angle
    var end: Angle
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addArc(center: center, radius: rect.midX, startAngle: start, endAngle: end, clockwise: false)
        return path
    }
}

struct PieSegmentLoader: View {
    
    @State var degree: Double = 10
    @State var isFurther = true
    
    var body: some View {
        PieSegment(start: .zero, end: .degrees(degree))
            .frame(width: 80, height: 80)
            .animation(
                Animation.linear(duration: 3)
                    .repeatForever(autoreverses: false),
                value: degree
            )
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                    withAnimation {
                        if isFurther {
                            if degree <= 360 {
                                degree += 1
                            }
                            if degree == 360 {
                                isFurther = false
                            }
                        } else {
                            if degree > 0 {
                                degree -= 1
                            }
                            if degree == 0 {
                                isFurther = true
                            }
                        }
                    }
                }
                RunLoop.current.add(timer, forMode: .common)
            }
    }
}

#Preview {
    PieSegmentLoader()
}
