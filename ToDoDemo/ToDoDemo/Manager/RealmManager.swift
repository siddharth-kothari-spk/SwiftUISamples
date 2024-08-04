//
//  RealmManager.swift
//  ToDoDemo
//
//  Created by Siddharth Kothari on 04/08/24.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm() {
        
        do {
            let configuration = Realm.Configuration(schemaVersion: 1) { migration, oldSchemaVersion in
                if oldSchemaVersion > 1 {
                    // do changes for migration
                }
            }
            
            Realm.Configuration.defaultConfiguration = configuration
            
            localRealm = try Realm()
        } catch {
            print("Error opening realm: \(error)")
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added new task to Realm: \(newTask)")
                }
            } catch {
                print("Could not found realm: \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                
                let taskToUpdate = localRealm.objects(Task.self).filter("id == %@", id)
                guard !taskToUpdate.isEmpty else {
                    return
                }
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Updated task with id: \(id) with completion status: \(completed)")
                }
            } catch (let error) {
                print("Error updating task with id: \(id), with error: \(error)")
            }
        }
    }
    
    func deletetask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                
                let taskToDelete = localRealm.objects(Task.self).filter("id == %@", id)
                guard !taskToDelete.isEmpty else {
                    return
                }
                
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("Deleted task with id: \(id))
                }
                
            } catch (let error) {
                print("Error deleting task: \(id) in Realm . \(error)")
            }
            
        }
    }
}
