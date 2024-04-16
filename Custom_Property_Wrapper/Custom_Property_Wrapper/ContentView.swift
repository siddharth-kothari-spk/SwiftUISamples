//
//  ContentView.swift
//  Custom_Property_Wrapper
//
//  Created by Siddharth Kothari on 16/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!").padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

@propertyWrapper struct Document {
    
    @State private var value = "" // private for a reason: when we interact with this property wrapper we want to add some extra work so that our new value gets written to disk automatically.
    
    private let url: URL
    
    // wrappedValue property will be computed
    var wrappedValue: String {
        get {
            value
        }
        
        // if we have a setter for wrappedValue then we’ll be modifying the struct we’re inside and that will cause problems. Fortunately, we’re not actually changing the Document struct: we’re using @State, so we’re bypassing the struct entirely and having SwiftUI store the value. So, rather than making a regular setter, we can instead make a nonmutating setter, because our underlying struct won’t actually be changing.
        nonmutating set {
            do {
                try newValue.write(to: url, atomically: true, encoding: .utf8)
                value = newValue
            }
            catch {
                print("Failed to write output")
            }
        }
    }
}
