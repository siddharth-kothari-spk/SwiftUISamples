//
//  RotateGestureView.swift
//  RotateGestureSample
//
//  Created by Siddharth Kothari on 16/12/24.
//

import SwiftUI

struct RotateGestureView: View {
  @State private var angle: Angle = .degrees(0) // how much the user has rotated
  @State private var velocity: Angle = .degrees(0) // how fast the rotation is happening
  @State private var startLocation: CGPoint = .zero // exact point where the rotation began.
  @State private var startAnchor: UnitPoint = .center // where the rotation began

  var body: some View {
    VStack {
      Text("Test")
    }
    .padding()
  }
}

#Preview {
  RotateGestureView()
}
