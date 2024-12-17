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
    
    /// Gesture: An instance that matches a sequence of events to a gesture, and returns a stream of values for each of its states.
    private var rotateGesture: some Gesture {
        /// RotateGesture: A gesture that recognizes a rotation motion and tracks the angle of the rotation.
        RotateGesture(minimumAngleDelta: .degrees(1.0))
            .onChanged { rotateGestureValueChanged in
                /// Adds an action to perform when the gesture's value changes.
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.5)) {
                    angle = rotateGestureValueChanged.rotation
                }
                velocity = rotateGestureValueChanged.velocity
                startLocation = rotateGestureValueChanged.startLocation
                startAnchor = rotateGestureValueChanged.startAnchor
            }
            .onEnded { rotateGestureValueEnded in
                /// Adds an action to perform when the gesture ends.
                withAnimation(.spring(duration: 0.3, bounce: 0.7, blendDuration: 0.5)) {
                    velocity = .degrees(0)
                }
            }
    }
    
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
