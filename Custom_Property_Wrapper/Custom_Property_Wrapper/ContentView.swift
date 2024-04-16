//
//  ContentView.swift
//  Custom_Property_Wrapper
//
//  Created by Siddharth Kothari on 16/04/24.
//

import SwiftUI

struct ContentView: View {
    @Document("test.txt") var document
    
    var body: some View {
        NavigationView(content: {
           /* NavigationLink(destination: Text("Destination")) {
                VStack {
                    //Text(document)
                    TextEditor(text: $document)
                    Button("Change document") {
                        document = String(Int.random(in: 1...1000))
                    }
                }
            }
            .navigationTitle("Simple Text")
            */
            VStack {
                //Text(document)
                TextEditor(text: $document)
                Button("Change document") {
                    document = String(Int.random(in: 1...1000))
                }
            }
        })
    }
}

#Preview {
    ContentView()
}

// right now SwiftUI doesn’t realize it should be watching our property wrapper for change notification, even though it has an @State property inside there. To fix this we need to make Document conform to the DynamicProperty protocol

@propertyWrapper struct Document: DynamicProperty {
    
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
    
    // SwiftUI’s own @State property wrapper uses the projected value to create a binding for its data, and if we do the same thing here then it would allow us to bind directly to a document so that every change we make gets saved out.
    var projectedValue: Binding<String> {
        Binding {
            wrappedValue
        } set: { newVal in
            wrappedValue = newVal
            // when our binding is written to we update wrappedValue, which in turn triggers our nonmutating setter, which is what causes the new value to be written to disk
        }
    }
    init(_ filename: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        url = paths[0].appendingPathExtension(filename)
        
        // we need to load the initial value of the text file and wrap that in a State object.
        let initialText = (try? String(contentsOf: url)) ?? ""
        _value = State(wrappedValue: initialText)
        
        
        
    }
}
