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
                ForEach(realmManager.tasks, id: \.self) { task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
//                            .swipeActions(edge: .trailing) {
//                                Button(role: .destructive) {
//                                    realmManager.deletetask(id: task.id)
//                                } label: {
//                                    Label("Delete", systemImage: "trash")
//                                }
//                            }
                    }
                    
                } // TODO: getting crash on deleting items
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let task = realmManager.tasks[index]
                        realmManager.deletetask(id: task.id)
                    }
                })
            }
            .onAppear(perform: {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            })
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Utilities.backgroundColor())


    }
}

#Preview {
    TasksView()
        .environmentObject(RealmManager())
}
