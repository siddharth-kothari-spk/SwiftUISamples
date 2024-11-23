//
//  ContentView.swift
//  CustomTextFieldAnimation
//
//  Created by Siddharth Kothari on 23/11/24.
//

// https://www.linkedin.com/posts/su-codee-676946321_swiftui-iosdeveloper-swift-activity-7265679222126329856-APFK/?utm_source=share&utm_medium=member_ios

import SwiftUI

struct ContentView: View {
    @FocusState var isActive
    /// A property wrapper type that can read and write a value that SwiftUI updates
    /// as the placement of focus within the scene changes.
    
    @State var emailField = ""
    @State var nameField = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
