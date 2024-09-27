//
//  RadialLayoutView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 27/09/24.
//

import SwiftUI

struct RadialLayoutView: View {
    var body: some View {
        CustomLayout {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Circle()
                    .frame(width: 44)
                    .overlay {
                        Image(systemName: "calendar")
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
            subView.place(at: CGPoint(x: 50 * index, y: 100 * index), proposal: .unspecified)
        }
    }
    
}
