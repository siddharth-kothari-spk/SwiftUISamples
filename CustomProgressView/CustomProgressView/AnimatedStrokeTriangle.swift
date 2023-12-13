//
//  AnimatedStrokeTriangle.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

/*
 To make this, you need to create the Triangle using SwiftUI Path and just replace Rectangle() with Triangle() from AnimatedStrokeSquare loader and you will get the AnimatedStrokeTriangle loader
 */
import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct AnimatedStrokeTriangle: View {
    @State private var trimEnd: CGFloat = 0.0

    var body: some View {
        Triangle()
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
    AnimatedStrokeTriangle()
}
