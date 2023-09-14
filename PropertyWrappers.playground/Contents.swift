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

//@Bindable
//The @Bindable property wrapper is used to create bindings to properties on your @Observable annotated models. Without @Bindable it's not possible to create a binding to an @Observable model. For example, the following code doesn't compile:

@Observable
class SearchModel {
  var query: String = ""
  var results: [SearchResult] = []

  // ...
}

struct SearchView {
  let searchModel: SearchModel

  var body: some View {
    // Cannot find '$searchModel' in scope
    TextField("Search query", text: $searchModel.query)
  }
}

// The $ prefixed version of a property is only avaialble when that property leverages a property wrapper since $myProperty accesses something called a projected property. If you're not entirely sure what that means, I recommend you take a look at this post.(https://www.donnywals.com/wrapping-your-head-around-property-wrappers-in-swift/)

// Given that we can't bind to our plain SearchModel's properties, we need some mechanism to enable this. One option would be to make our own Binding instances and passing a get and set closure. This would be tedious and error prone.

//The alternative is the @Bindable property wrapper:

struct SearchViewBindable {
  @Bindable var searchModel: SearchModel

  var body: some View {
    // This works
    TextField("Search query", text: $searchModel.query)
  }
}
// With @Bindable we have access to the $ prefixed property to obtain a projected value from the property wrapper, and the projected value provides our binding. In other words, we can now provide a binding to our model's query property where we otherwise would not be able to do this.


//One neat trick you might need to employ for observable objects that exist in the environment for example is the following:

struct SearchViewEnvironment {
  @Environment(\.searchModel) var searchModel

  var body: some View {
    @Bindable var bindableSearchModel = searchModel
    // This works
    TextField("Search query", text: $bindableSearchModel.query)
  }
}
//With this technique you extract the search model from the environment as a non-bindable property. To make it bindable, you can create a shadow property inside of your body that's marked as @Bindable.
// You should use @Bindable if:

// 1.You're wrapping a class annotated with @Observed
// 2.You need to provide another view a binding to a property on your model object
//Note that you never choose between @Binding and @Bindable. @Binding indicates that a view needs to receive a binding to a property so it can read and mutate state owned by another object. @Bindable indicates that we want to pass a binding to that property to another view, allowing that view to read and mutate the property.

//-----------------------------------------------------------

// @StateObject
//Only available in iOS 14+, iPadOS 14+, watchOS 7+, macOS 10.16+ etc. On iOS 17+ you will most likely leverage the @Observable macro for your models instead of one of the ObservableObject related property wrappers.

//The @StateObject property is used for similar reasons as @State, except it's applied to ObservableObjects. An ObservableObject is always a reference type (class) and informs SwiftUI whenever one of its @Published properties will change.

class DataProvider: ObservableObject {
  @Published var currentValue = "a value"
}

struct DataOwnerView: View {
  @StateObject private var provider = DataProvider()

  var body: some View {
    Text("provider value: \(provider.currentValue)")
  }
}

/*
 Notice that DataOwnerView creates an instance of DataProvider. This means that DataOwnerView owns the DataProvider. Whenever the value of DataProvider.currentValue changes, DataOwnerView will rerender.

 Internally, SwiftUI will keep the initially created instance of DataProvider around whenever SwiftUI decides to discard and recreate DataOwnerView for a fresh render. This means that a @StateObject for any given view is initialized only once.

 SwiftUI sets the instance associated with your @StateObject aside and reuses it when the view that owns the @StateObject is initialized again. This means that your new view instance does not get a new instance of the property marked as @StateObject since it's reused.

 In other words, a property marked as @StateObject will keep its initially assigned ObservedObject instance as long as the view is needed, even when the struct gets recreated by SwiftUI.

 This is the same behavior you see in @State, except it's applied to an ObservableObject rather than a value type like a struct.
 
 You should use @StateObject if:

 1. You want to respond to changes or updates in an ObservableObject.
 2. The view you're using @StateObject in creates the instance of the ObservableObject itself.

 */

