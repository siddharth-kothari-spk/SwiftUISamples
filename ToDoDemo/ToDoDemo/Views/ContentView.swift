//
//  ContentView.swift
//  ToDoDemo
//
//  Created by Siddharth Kothari on 02/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddTaskView = false
    @StateObject private var realmManager = RealmManager()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
                .environmentObject(realmManager)
            
            AddTaskButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView, content: {
            AddTaskView()
                .environmentObject(realmManager)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Utilities.backgroundColor())
    }
}

#Preview {
    ContentView()
}
