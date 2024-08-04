//
//  Task.swift
//  ToDoDemo
//
//  Created by Siddharth Kothari on 04/08/24.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
