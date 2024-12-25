//
//  ActivityProgress.swift
//  ActivityProgress
//
//  Created by Siddharth Kothari on 25/12/24.
//

import SwiftUI

struct ActivityProgress: View {
    let icon: String
    let title: String
    let details: String
    let colour: Color
   // @Binding var progress: Double
    
    var body: some View {
        // A stylized view, with an optional label, that visually collects a logical grouping of content.
        // Use a group box when you want to visually distinguish a portion of your user interface with an optional title for the boxed content.

        GroupBox {
            Text(details)
                .font(.system(size: 25))
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 5)
                    .foregroundStyle(colour.opacity(0.1))
                Circle()
                    .trim(from: 0.0, to: CGFloat(80))
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    // StrokeStyle: The characteristics of a stroke that traces a path.
                    )
                    .foregroundStyle(colour)
                    .rotationEffect(Angle(degrees: -90))
                // rotationEffect: Rotates a view's rendered output in two dimensions around the specified point.
                
                Text("\(Int(80.0))")
                    .font(.headline)
                    .contentTransition(.numericText())
                // contentTransition: Modifies the view to use a given transition as its method of animating changes to the contents of its views.
            }
            .frame(width: 70, height: 70)
            .padding(10)
            
        } label: {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundStyle(colour)
                    .padding(10)
                    .background(colour.opacity(0.1), in: Circle())
                
                Text(title)
                    .font(.headline)
            }
        }

    }
}

#Preview {
    ActivityProgress(icon: "flame.fill", title: "Energy", details: "200 out of 500", colour: .red)
}
