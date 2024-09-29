//
//  AnalogueButton.swift
//  Spatial_Borders
//
//  Created by Siddharth Kothari on 29/09/24.
//

import SwiftUI

struct AnalogueButton: View {
    var body: some View {
        ZStack {
          Circle()
            .fill(.primary.opacity(0.3))
            .strokeBorder(
              AngularGradient(
                gradient: Gradient(
                  colors: [
                    .black.opacity(0.25),
                    .white,
                    .black.opacity(0.25),
                    .white,
                    .black.opacity(0.25)
                  ]
                ),
                center: .center,
                startAngle: .zero,
                endAngle: .degrees(360)
              ),
              style: .init(lineWidth: 3.0)
            )
            .strokeBorder(.black, style: .init(lineWidth: 1.0))
            
          Image(systemName: "arrow.up")
            .font(.system(size: 20.0, weight: .bold))
            .foregroundStyle(.white)
            .shadow(color: .black.opacity(0.4), radius: 1.0, y: -1.0)
        }
        .frame(width: 40.0)
    }
}

#Preview {
    AnalogueButton()
}
