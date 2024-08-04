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
    
    init() {
        openRealm()
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
                    print("Added new task to Realm: \(newTask)")
                }
            } catch {
                print("Could not found realm: \(error)")
            }
        }
    }
}
