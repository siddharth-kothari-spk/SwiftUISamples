//
//  2.ObservableAsLet.swift
//  ObservableVsObservableObject
//
//  Created by Siddharth Kothari on 12/02/24.
//

import SwiftUI

// In the ObservableAsState section we have an example of defining an @Observable as a let. We only made one mistake when doing so; we owned the instance so we should have used @State.

struct ObservableAsLet: View {
    @State var id = UUID()
    @State var counter = Counter()
    /*
     Notice how we’ve moved the creation of our Counter up to the ContentView. The ButtonView now receives the instance of Counter as an argument to its initializer. This means that we don’t own this instance, and we don’t need to apply any property wrappers. We can simply use a let, and SwiftUI will update our view when needed.

     However, we’ll quickly run into a limitation with an @Observable that’s declared as a let; we can’t bind to it.
     */

      var body: some View {
        VStack {
          Button("Change id") {
            id = UUID()
          }
          Text("Current id: \(id)")

          ButtonView(counter: counter)
        }.padding()
      }
}

struct ButtonView: View {
  let counter: Counter
  // when we receive our @Observable from another view, we can safely use a let instead of @State:

  var body: some View {
    VStack {
      Text("Counter is tapped \(counter.currentValue) times")
      Button("Increase") {
        counter.currentValue += 1
      }
    }.padding()
  }
}
#Preview {
    ObservableAsLet()
}
