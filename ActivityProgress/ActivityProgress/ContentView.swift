//
//  ContentView.swift
//  ActivityProgress
//
//  Created by Siddharth Kothari on 25/12/24.
//

// https://www.linkedin.com/posts/su-codee-676946321_swiftui-activity-progress-inspired-by-activity-7277309907027075072-lB4N/?utm_source=share&utm_medium=member_ios

import SwiftUI

struct ContentView: View {
    @State var calories: Double = 0.0
    @State var training: Double = 0.0
    
    var body: some View {
        HStack {
            ActivityProgress(icon: "flame.fill", title: "Calories", details: "750 out of 1000 calories", colour: .red, progress: $calories)
            ActivityProgress(icon: "stopwatch.fill", title: "Training", details: "Trained 39 out of 60 minutes", colour: .cyan, progress: $training)
        }
        .padding()
        .onAppear {
            withAnimation(.spring(.bouncy)) {
                calories += 50
                training += 65
            }
        }
    }
}

#Preview {
    ContentView()
}
