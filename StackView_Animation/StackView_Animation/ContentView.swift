//
//  ContentView.swift
//  StackView_Animation
//
//  Created by Siddharth Kothari on 15/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var tasks: [DataModel] = [
        DataModel(title: "Task A", isComplete: false),
        DataModel(title: "Task B", isComplete: false),
        DataModel(title: "Task C", isComplete: false),
        DataModel(title: "Task D", isComplete: false),
        DataModel(title: "Task E", isComplete: false),
        DataModel(title: "Task F", isComplete: false),
    ]
    @State var show = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
