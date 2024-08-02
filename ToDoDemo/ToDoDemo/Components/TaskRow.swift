//
//  TaskRow.swift
//  ToDoDemo
//
//  Created by Siddharth Kothari on 02/08/24.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: completed ? "checkmark.circle" : "circle")
            Text(task)
        }
        .frame(maxWidth: .infinity)
        .border(Color.black)
        .clipShape(.ellipse)
    }
}

#Preview {
    TaskRow(task: "Test task", completed: true)
}
