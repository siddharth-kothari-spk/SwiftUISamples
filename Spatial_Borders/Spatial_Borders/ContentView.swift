//
//  ContentView.swift
//  Spatial_Borders
//
//  Created by Siddharth Kothari on 28/09/24.
//

// courtsey: https://uvolchyk.medium.com/exploring-spatial-borders-with-swiftui-0079fd1e0979

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Capsule()
        .fill(.gray.opacity(0.25))
        .overlay {
            // One of the possible options of adding a border is overlaying another shape with the stroke applied on it.
            Capsule()
                .stroke(lineWidth: 5.0)
                .fill(
                    LinearGradient(
                        // Instance of Gradient type we pass as the first parameter defines how different colors we pass into are represented along the LinearGradient.
                        gradient: Gradient(stops: [
                            .init(color: .red.opacity(0.4), location: 0.25),
                            .init(color: .blue.opacity(0.4), location: 0.5),
                            .init(color: .yellow.opacity(0.4), location: 0.75),
                            .init(color: .cyan.opacity(0.4), location: 0.85)]),
                        // Unit is a normalized value in range from 0.0 to 1.0. Normalized means that it represents a relative value
                        startPoint: .init(x: 0.1, y: 1.0),
                        endPoint: .init(x: 0.2, y: 1.0))
                    // For example, we have a shape that is 300 width and 400 height. A unit point (x: 0.2, y: 0.4) within this shape has absolute coordinates (x: 0.2 * 300, y: 0.4 * 400), or (x: 60, y: 160).
                )
        }
      Text("Spatial Borders ✨")
        .font(.system(size: 17.0, weight: .medium))
        .foregroundStyle(.primary)
    }
    .frame(width: 200.0, height: 44.0)
  }
}

#Preview {
    ContentView()
}
