//
//  RadialLayoutView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 27/09/24.
//

import SwiftUI

struct RadialLayoutView: View {
    var icons = ["calendar", "message", "figure", "calendar"]
    var body: some View {
        RadialLayout {
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
            var point = CGPoint(x: 50 * index, y: 50 * index)
                .applying(CGAffineTransform(rotationAngle: 30))
            
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
        
        for (index, subView) in subviews.enumerated() {
            
            // position
            var point = CGPoint(x: 0, y: radius)
                .applying(CGAffineTransform(rotationAngle: 60))
            
            // center
            point.x += bounds.midX
            point.y += bounds.midY
            
            subView.place(at: point,
                          anchor: .center,
                          proposal: .unspecified)
        }
    }
    
}
