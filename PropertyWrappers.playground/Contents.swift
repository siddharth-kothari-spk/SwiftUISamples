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

// 1. Primitives like Int, String, etc.
// 2. Structs where mutation leads to assigning a new value to your @State.
// 3. iOS 17+: @Observable objects that are owned by the view.
// Note that you should mark your @State properties private as a best-practice. No external sources should modify your @State properties.

// Note that you can also use @State on reference types (class) but changing properties on the instance itself won't count as an update. Not even if the property you changed is @Published. See @ObservedObject, @StateObject, and @EnvironmentObject for ways to handle this better. On iOS 17+, objects annotated with the @Observable can be annotated with @State and updates will work. The @Observable macro uses a special mechanism to communicate model changes to the view.

//-----------------------------------------------------------


// @Binding
//The @Binding property wrapper is used for properties that are passed by another view. The view that receives the binding is able to read the bound property, respond to changes made by external sources (like the parent view), and it has write access to the property. Meaning that updating a @Binding updates the corresponding property on the view that provided the @Binding.

struct BindingView: View {
  @Binding var intValue: Int

  var body: some View {
    VStack {
      Button("Increment") {
        intValue += 1
      }
    }
  }
}

// using Binding View
struct StateView: View {
  @State private var intValue = 0

  var body: some View {
    VStack {
      Text("intValue equals \(intValue)")

      BindingView(intValue: $intValue)
    }
  }
}

// pass a binding to the @State wrapped intValue to BindingView by prefixing it with a $: $intValue. The projected value of a @State property is a Binding<T> that you can pass to child views so they can modify @State properties through the binding rather than directly.

//Internally, SwiftUI will not keep a @Binding around when your view is discarded. It doesn't need to because the @Binding is always passed by an external source. Unlike @State where SwiftUI keeps the property around so its value persists when a view is discarded and recreated for a fresh render.

//You should use @Binding if:

// 1. You need read- and write access to a property that's owned by a parent view.
// 2. The wrapped property is a value type (struct or enum). (You can also use an @Binding for reference types (class) but it's not nearly as common.)
// 3. You don't own the wrapped property (it's provided by a parent view).

//-----------------------------------------------------------

