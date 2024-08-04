//
//  TasksView.swift
//  ToDoDemo
//
//  Created by Siddharth Kothari on 02/08/24.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            Text("My tasks")
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(realmManager.tasks, id: \.id) { task in
                    TaskRow(task: task.title, completed: task.completed)
                        .onTapGesture {
                            realmManager.updateTask(id: task.id, completed: !task.completed)
                        }
                }
            }
            .onAppear(perform: {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Utilities.backgroundColor())


    }
}

#Preview {
    TasksView()
        .environmentObject(RealmManager())
}
