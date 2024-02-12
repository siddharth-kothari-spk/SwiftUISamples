//
//  1.ObservableAsState.swift
//  ObservableVsObservableObject
//
//  Created by Siddharth Kothari on 12/02/24.
//

import Foundation
import SwiftUI

// With ObservableObject, we need to use a specific property wrapper to tell the view “this object is a source of truth”. This allows SwiftUI to redraw your view when the object updates one of its @Published properties.

// Note that the view won’t care which property changed. Any change to any @Published property will cause your view body to be re-evaluated (and redrawn) regardless of whether the object update results in a changed view.

@Observable
class Counter {
  var currentValue: Int = 0
}


struct ObservableAsState: View {
   // When we apply @State to your creation of an @Observable, we do this due to @State's ability to cache the instance it’s applied to across view redraws.
    @State var id = UUID()
    
    var body: some View {
        VStack {
            Button("Change id") {
                id = UUID()
            }
            Text("Current id: \(id)")
            
            ButtonView1()
            
            ButtonView2()
        }.padding()
    }
}

struct ButtonView1: View {
  let counter = Counter()

  var body: some View {
    VStack {
      Text("Counter is tapped \(counter.currentValue) times")
      Button("Increase1") {
        counter.currentValue += 1
      }
    }.padding()
  }
}

/* When you run this code, you’ll find that tapping the Increase button works without any issues. The counter goes up and the view updates.

However, when you tap on Change id the counter resets back to 0.

That’s because once the ContentView redraws, a new instance of ButtonView is created which will also create a new Counter. */

struct ButtonView2: View {
  @State var counter = Counter()
 // We’ve now wrapped counter in @State. Changing the id in this view’s parent now doesn’t reset the counter because @State caches the counter instance for the duration of this view’s lifecycle.

  var body: some View {
    VStack {
      Text("Counter is tapped \(counter.currentValue) times")
      Button("Increase2") {
        counter.currentValue += 1
      }
    }.padding()
  }
}
#Preview {
    ObservableAsState()
}
