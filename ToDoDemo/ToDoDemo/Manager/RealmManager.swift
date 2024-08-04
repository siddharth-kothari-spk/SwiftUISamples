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
            let configuration = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = configuration
            
            localRealm = try Realm()
        } catch {
            print("Error opening realm: \(error)")
        }
    }
}
