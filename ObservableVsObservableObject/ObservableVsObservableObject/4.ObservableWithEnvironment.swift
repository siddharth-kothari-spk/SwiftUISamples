//
//  4.ObservableWithEnvironment.swift
//  ObservableVsObservableObject
//
//  Created by Siddharth Kothari on 12/02/24.
//

import Foundation
import SwiftUI

/*
 Similar to how we can add observable objects to the SwiftUI environment, we can also add our @Observable objects to the environment. To do this, we can’t use the environmentObject view modifier, nor do we use the @EnvironmentObject property wrapper.

 Instead, we use the .environment view modifier which has received some now features in iOS 17 to be able to handle @Observable models.
 */

@Observable
class SearchModel2 {
  var query = ""
  // ...
}

struct ObservableWithEnvironment: View {
  @State var searchModel = SearchModel2()

  var body: some View {
    NestedView()
      .environment(searchModel)
      // we’re not passing an environment key along to the .environment view modifier. That because it works in a similar way to .environmentObject where we don’t need to pass a specific key. Instead, SwiftUI will enforce that there’s only ever one instance of SearchModel in our view hierarchy which makes environment keys obsolete.
  }
}

struct NestedView: View {
  @Environment(SearchModel2.self) var searchModel
    /* By writing our code like this, SwiftUI knows which type of object to look for in the environment and we’ll be handed our instance from there.
    
    If SwiftUI can’t find an instance of SearchModel, our app will crash.*/
    
    var body: some View {
        Text("NestedView")
    }
}

#Preview(body: {
    ObservableWithEnvironment(searchModel: SearchModel2())
})
