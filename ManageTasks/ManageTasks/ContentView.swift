//
//  ContentView.swift
//  ManageTasks
//
//  Created by Siddharth Kothari on 21/07/23.
//

import SwiftUI
import Algorithms

struct ContentView: View {
    
    @State private var toDoTasks: [String] = ["@Observable Migration", "Keyframe Animations", "Migrate to Swift Data"]
    @State private var inProgressTasks: [String] = []
    @State private var doneTasks: [String] = []
    
    @State private var isToDoTargeted = false
    @State private var isInProgressTargeted = false
    @State private var isDoneTargeted = false

    var body: some View {
        HStack(spacing: 12) {
            BoardView(title: "To Do", tasks: toDoTasks, isTargeted: isToDoTargeted).dropDestination(for: String.self) { items, location in
                for task in items {
                    inProgressTasks.removeAll(where: {$0 == task })
                    doneTasks.removeAll(where: {$0 == task} )
                }
                // by default drag and drop creates a copy and not passed by reference
                let total = toDoTasks + items
                toDoTasks = Array(total.uniqued())
                return true
            } isTargeted: { isTargeted in
                isToDoTargeted = isTargeted
            }
            
            
            BoardView(title: "In Progress", tasks: inProgressTasks, isTargeted: isInProgressTargeted).dropDestination(for: String.self) { items, location in
                for task in items {
                    toDoTasks.removeAll(where: {$0 == task })
                    doneTasks.removeAll(where: {$0 == task} )
                }
                // by default drag and drop creates a copy and not passed by reference
                let total = inProgressTasks + items
                inProgressTasks = Array(total.uniqued())
                return true
            } isTargeted: { isTargeted in
                isInProgressTargeted = isTargeted
            }

            BoardView(title: "Done", tasks: doneTasks, isTargeted: isDoneTargeted).dropDestination(for: String.self) { items, location in
                for task in items {
                    inProgressTasks.removeAll(where: {$0 == task })
                    toDoTasks.removeAll(where: {$0 == task} )
                }
                // by default drag and drop creates a copy and not passed by reference
                let total = doneTasks + items
                doneTasks = Array(total.uniqued())
                return true
            } isTargeted: { isTargeted in
                isDoneTargeted = isTargeted
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
