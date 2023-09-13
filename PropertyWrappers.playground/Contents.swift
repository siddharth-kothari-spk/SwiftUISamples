// https://swiftuipropertywrappers.com/

import SwiftUI


// @State
// The @State property wrapper is used inside of View objects and allows your view to respond to any changes made to @State. You use @State for properties that are owned by the view that it's contained in. In other words, a view initializes its @State properties itself. It does not receive its @State properties from another object.

struct StateExample: View {
    struct MyModelObject {
        
    }
    
  @State private var intValue = 0
  @State private var modelObject = MyModelObject()

  var body: some View {
    VStack {
      Text("intValue equals \(intValue)")

      Button("Increment") {
        intValue += 1
      }
    }
  }
}

// Internally, SwiftUI will store your @State property's value and persist its value throughout re-renders of your view. This makes it a good fit for state that is managed by the view itself and should be persisted when SwiftUI must discard and recreate your view instance during a refresh.

//WIth @State, your view rerenders when a new value is assigned to your @State property.

//You will typically apply @State to:

//Primitives like Int, String, etc.
//Structs where mutation leads to assigning a new value to your @State.
//iOS 17+: @Observable objects that are owned by the view.
//Note that you should mark your @State properties private as a best-practice. No external sources should modify your @State properties.

// Note that you can also use @State on reference types (class) but changing properties on the instance itself won't count as an update. Not even if the property you changed is @Published. See @ObservedObject, @StateObject, and @EnvironmentObject for ways to handle this better. On iOS 17+, objects annotated with the @Observable can be annotated with @State and updates will work. The @Observable macro uses a special mechanism to communicate model changes to the view.
