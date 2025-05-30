//
//  ContentView.swift
//  ListProblem_SeanAllen
//
//  Created by Siddharth Kothari on 10/09/24.
//

// courtsey: https://www.youtube.com/watch?v=cpT02OtOasE&ab_channel=SeanAllen
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<20) { _ in
                    cellView
                }
            }
            .safeAreaInset(edge: .bottom) {
                bottomView
            }
            .navigationTitle("Test list")
        }
    }
    
    var cellView: some View {
        HStack(alignment: .top, spacing: 15, content: {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .frame(width: 80, height: 80)
                .foregroundStyle(.cyan.gradient.opacity(0.5))
            
            Text("Test title")
        })
    }
    
    var bottomView: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(.red.opacity(0.3))
            .frame(width: .infinity, height: 50)
            .padding(.all, 10)
    }
}

#Preview {
    ContentView()
}
