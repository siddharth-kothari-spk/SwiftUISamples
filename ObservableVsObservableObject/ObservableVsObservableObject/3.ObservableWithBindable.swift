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
  let model: SearchModel

  var body: some View {
    TextField("Search query", text: $model.query) // Error: Cannot find '$model' in scope
  }
}

#Preview {
    ObservableWithBindable(model: SearchModel())
}

