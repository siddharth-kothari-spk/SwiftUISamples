//
//  ContentView.swift
//  CustomTextFieldAnimation
//
//  Created by Siddharth Kothari on 23/11/24.
//

// https://www.linkedin.com/posts/su-codee-676946321_swiftui-iosdeveloper-swift-activity-7265679222126329856-APFK/?utm_source=share&utm_medium=member_ios

import SwiftUI

struct ContentView: View {
    @State var emailField = ""
    @State var nameField = ""
    
    var body: some View {
        VStack(spacing: 45) {
            InfoTextField(title: "Name", text: $nameField)
            InfoTextField(title: "Email", text: $emailField)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
