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
        .fill(.gray.opacity(0.5))
        .overlay {
            // One of the possible options of adding a border is overlaying another shape with the stroke applied on it.
            Capsule()
                .stroke(lineWidth: 2.0)
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
