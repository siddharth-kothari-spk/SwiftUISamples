//
//  RadialLayoutView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 27/09/24.
//

import SwiftUI

struct RadialLayoutView: View {
    var icons = ["calendar", "message", "figure", "pencil.circle.fill"]
    var numbers = [12,1,2,3,4,5,6,7,8,9,10,11]
    
    @State var isRadial = true
    
    var body: some View {
        let layout = isRadial ? AnyLayout(RadialLayout()) : AnyLayout(CustomLayout())
        ZStack {
            
            Circle()
                //.foregroundStyle(.white.shadow(.inner(color: .gray, radius: 30, x: 30, y: 30)))
                //.foregroundStyle(.red.shadow(.inner(color: .blue.opacity(0.5), radius: 30, x: 50, y: 150)))
                .foregroundStyle(.red.shadow(.drop(color: .blue, radius: 30, x: 30, y: 30)))
            
            layout {
                ForEach(icons, id:\.self) { item in
                    Circle()
                        .frame(width: 44)
                        .foregroundStyle(.black)
                        .overlay {
                            Image(systemName: item)
                                .foregroundStyle(.white)
                    }
                }
            }
            .frame(width: 120)
            
            layout {
                ForEach(numbers, id: \.self) { item in
                    Text("\(item)")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    .foregroundStyle(.black)
                    .offset(x: isRadial ? 0 : 50)
                }
            }
            .frame(width: 240)
            
            layout {
                ForEach(numbers, id: \.self) { item in
                    Text("\(item * 5)")
                        .font(.system(.caption2, design: .rounded))
                        .foregroundStyle(.black)
                        .offset(x: isRadial ? 0 : 100)
                }
            }
            .frame(width: 360)
            
            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: 5, dash: [1, 12])) // returns ChartSymbolShape
                //.stroke(style: StrokeStyle(lineWidth: 10, dash: [1, 12])) // returns Shape
                .frame(width: 220)
            
            Circle()
                //.strokeBorder(style: StrokeStyle(lineWidth: 5, dash: [1, 12])) // returns ChartSymbolShape
                .stroke(style: StrokeStyle(lineWidth: 10, dash: [1, 12])) // returns Shape
                .frame(width: 280)
        }
        .onTapGesture {
            withAnimation {
                isRadial.toggle()
            }
        }
    }
}

#Preview {
    RadialLayoutView()
}

struct CustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
        /// Use the default value to prevent a flexible view from disappearing
        /// into a zero-sized frame, and ensure the unspecified value remains
        /// visible during debugging.
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subView) in subviews.enumerated() {
            
            // position
            var point = CGPoint(x: 15 * index, y: 15 * index)
                .applying(CGAffineTransform(rotationAngle:  CGFloat(5 * index + 5)))
            
            // center
            point.x += bounds.midX
            point.y += bounds.midY
            
            subView.place(at: point,
                          anchor: .center,
                          proposal: .unspecified)
        }
    }
}

struct RadialLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
        /// Use the default value to prevent a flexible view from disappearing
        /// into a zero-sized frame, and ensure the unspecified value remains
        /// visible during debugging.
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        let radius = bounds.width / 3.0
        let angle = Angle.degrees(360.0 / Double(subviews.count)).radians
        
        for (index, subView) in subviews.enumerated() {
            
            // position
            var point = CGPoint(x: 0, y: -radius)
                .applying(CGAffineTransform(rotationAngle: angle * Double(index)))
            
            // center
            point.x += bounds.midX
            point.y += bounds.midY
            
            subView.place(at: point,
                          anchor: .center,
                          proposal: .unspecified)
        }
    }
    
}
