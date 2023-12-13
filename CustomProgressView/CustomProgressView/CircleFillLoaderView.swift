//
//  CircleFillLoaderView.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

/*
 Create a trimEnd property which will be initially 0. Create a fill circle and apply a trim modifier on it and then apply animation and change the trimEnd value to 1 when the view appears.
 */
import SwiftUI

struct CircleFillLoaderView: View {
    
    @State private var trimEnd: CGFloat = 0.0
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: trimEnd)
            .frame(width: 80, height: 80)
            .animation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true)
                    , value: trimEnd
            )
            .onAppear {
                trimEnd = 1
            }
    }
}

#Preview {
    CircleFillLoaderView()
}
