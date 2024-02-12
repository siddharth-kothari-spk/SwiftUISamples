//
//  3.ObservableWithBindable.swift
//  ObservableVsObservableObject
//
//  Created by Siddharth Kothari on 12/02/24.
//

import SwiftUI
// TODO: link to check: https://www.donnywals.com/whats-the-difference-between-binding-and-bindable/

@Observable
class SearchModel {
  var query = ""
  // ...
}

struct ObservableWithBindable: View {
    /*
     Since this view receives the SearchModel from another view, we can’t apply the @State property wrapper to our @Observable. If we did own the SearchModel instance by creating it, we’d annotate it with @State and this would enable us to bind to properties of the SearchModel.

     If we want to be able to create bindings to @Observable models that we don’t own, we can apply the @Bindable property wrapper instead:
     */
    @Bindable var model: SearchModel

  var body: some View {
    TextField("Search query", text: $model.query) // Error: Cannot find '$model' in scope
      // Because our SearchModel is a plain let, we can’t access the $ prefixed version of it
      
  }
}

#Preview {
    ObservableWithBindable(model: SearchModel())
}

