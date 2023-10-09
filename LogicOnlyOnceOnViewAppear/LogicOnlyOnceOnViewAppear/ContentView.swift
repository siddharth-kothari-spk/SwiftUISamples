//
//  ContentView.swift
//  LogicOnlyOnceOnViewAppear
//
//  Created by Siddharth Kothari on 09/10/23.
//




import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(content: {
                Text("FirstView")
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding()
                
                NavigationLink("Next View") {
                    View2()
                }.buttonStyle(.borderedProminent)
            })
        }
        .padding()
        .onFirstAppear {
            print("⭐️ On First Appear ! \(Date())")
        }
        .onAppear(perform: {
            print("Run on Appear!!! \(Date())")
        })
        .onDisappear(perform: {
            print("Run on Disappear!! \(Date())")
        })
        .task {
            print("📀 Task print!")
        }
    }
}

#Preview {
    ContentView()
}


struct View2: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is View 2")
                    .padding()
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
            .padding()
        }
    }
}
