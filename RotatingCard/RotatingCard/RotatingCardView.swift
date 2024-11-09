//
//  RotatingCardView.swift
//  RotatingCard
//
//  Created by Siddharth Kothari on 09/11/24.
//

import SwiftUI

struct RotatingCardView: View {
    var imageName: String
    var rotatingAngle: Double
    var yOffset: CGFloat
    var show: Bool
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 230, height: 290)
            .rotation3DEffect(
                .radians(show ? 1 : 0),
                axis: (x: 0.8, y: 1.3, z: 0.3),
                anchor: .center,
                anchorZ: 0.0,
                perspective: show ? 0.5 : 0
            )
            .rotationEffect(.degrees(show ? rotatingAngle : 0))
            .offset(y: show ? yOffset : 0)
    }
}

#Preview {
    RotatingCardView(imageName: "pic1", rotatingAngle: 0, yOffset: 0.5, show: false)
}
