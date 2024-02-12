//
//  AppSettings.swift
//  ObservableVsObservableObject
//
//  Created by Siddharth Kothari on 12/02/24.
//

import Foundation
import Combine
import SwiftUI

@Observable
class AppSettings {
  var hidesTitles = false
  var trackHistory = true
  var readingListEnabled = true
}

struct SampleView: View {
  // the view owns this instance
  @State var appSettings1 = AppSettings()

  // the view receives this instance
  let appSettings2: AppSettings

  // the view receives this instance and wants to bind to properties
  @Bindable var appSettings3: AppSettings

  // we're grabbing this AppSettings object from the Environment
  @Environment(AppSettings.self) var appSettings4

  var body: some View {
      Text("test")
  }
}
