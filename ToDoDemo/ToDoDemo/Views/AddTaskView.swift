//
//  AddTaskView.swift
//  ToDoDemo
//
//  Created by Siddharth Kothari on 02/08/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var taskToAdd: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Create a new task")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter new task to add", text: $taskToAdd)
                .textFieldStyle(.roundedBorder)
            
            Button {
                print("Task added")
            } label: {
                Text("Add task")
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(.blue))
                    .clipShape(.capsule)
            }
            
            Spacer()
        })
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Utilities.backgroundColor())
    }
}

#Preview {
    AddTaskView()
}
