//
//  ContentView.swift
//  ListProblem_SeanAllen
//
//  Created by Siddharth Kothari on 10/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            List {
                ForEach(0..<20) { _ in
                    HStack(alignment: .top, spacing: 15, content: {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.cyan.gradient.opacity(0.5))
                        
                        Text("Test title")
                    })
                }
            }
            .safeAreaInset(edge: .bottom) {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.red.opacity(0.3))
                    .frame(width: .infinity, height: 50)
                    .padding()
            }
        }
        .navigationTitle("List Problem")
    }
}

#Preview {
    ContentView()
}
