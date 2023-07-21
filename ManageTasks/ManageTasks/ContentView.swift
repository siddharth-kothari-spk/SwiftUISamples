//
//  ContentView.swift
//  ManageTasks
//
//  Created by Siddharth Kothari on 21/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var toDoTasks: [String] = ["@Observable Migration", "Keyframe Animations", "Migrate to Swift Data"]
    @State private var inProgressTasks: [String] = []
    @State private var doneTasks: [String] = []

    var body: some View {
        HStack(spacing: 12) {
            BoardView(title: "To Do", tasks: toDoTasks)
            BoardView(title: "In Progress", tasks: inProgressTasks)
            BoardView(title: "Done", tasks: doneTasks)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
