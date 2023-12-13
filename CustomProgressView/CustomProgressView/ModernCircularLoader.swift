//
//  ModernCircularLoader.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

/*
 Create a circle with a stroke. Apply trim modifier on it. This will trim the Circle on the base of the value. If the trimEnd value is 0 then the circle will be invisible and if the trimEnd value is 0.6 then the circle will fill 60% and tried 40%. Initially, trimEnd will be 0.6.

 Apply easeIn animation when trimEnd value changes. After that apply rotationEffect on the base of the animate property. If animate is true then the rotation will be 270 + 360 otherwise will be 270.

 Then apply linear animation when animate value changes. Then inside onAppear change animate to true and trimEnd into zero and then run the code.
 */
import SwiftUI

struct ModernCircularLoader: View {
    @State private var trimEnd = 0.6
    @State private var animate = false
    
    var body: some View {
        Circle()
            .trim(from: 0.0,to: trimEnd)
            .stroke(.black, style: StrokeStyle(lineWidth: 7,lineCap: .round,lineJoin:.round))
            .animation(
                Animation.easeIn(duration: 1.5)
                    .repeatForever(autoreverses: true),
                value: trimEnd
            )
            .frame(width: 70,height: 70)
            .rotationEffect(Angle(degrees: animate ? 270 + 360 : 270))
            .animation(
                Animation.linear(duration: 1)
                    .repeatForever(autoreverses: false),
                value: animate
            )
            .onAppear{
                animate = true
                trimEnd = 0
            }
    }
}

#Preview {
    ModernCircularLoader()
}
