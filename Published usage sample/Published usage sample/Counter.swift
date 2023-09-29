//
//  Counter.swift
//  Published usage sample
//
//  Created by Siddharth Kothari on 29/09/23.
//

import Foundation

class Counter: ObservableObject {
    @Published var count = 0 // marked this property as observable, so that any changes to it will trigger an update in the views that depend on it.
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
}
