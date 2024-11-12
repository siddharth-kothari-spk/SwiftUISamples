//
//  ContentView.swift
//  Secure_Password
//
//  Created by Siddharth Kothari on 12/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-iosdeveloper-activity-7261728661521743872-HXPA?utm_source=share&utm_medium=member_desktop

import SwiftUI

struct ContentView: View {
    @State var password: String = ""
    @FocusState var isFocussed: Bool
    ///A property wrapper type that can read and write a value that SwiftUI updates as the placement of focus within the scene changes.
    
    var body: some View {
        HStack(content: {
            Image(systemName: "lock.fill")
                .padding(.leading)
            SecureField("Passowrd", text: $password)
                .padding(.leading,8)
                .focused($isFocussed)
                .frame(height: 50)
        })
        .background(Color(.systemGray6), in: .rect(cornerRadius: 12))
        .padding()
    }
}

#Preview {
    ContentView()
}
