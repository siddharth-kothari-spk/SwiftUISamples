//
//  ContentView.swift
//  ToDoDemo
//
//  Created by Siddharth Kothari on 02/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
            
            AddTaskButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView, content: {
            AddTaskView()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Utilities.backgroundColor())
    }
}

#Preview {
    ContentView()
}
