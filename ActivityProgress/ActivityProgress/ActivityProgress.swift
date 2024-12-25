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
