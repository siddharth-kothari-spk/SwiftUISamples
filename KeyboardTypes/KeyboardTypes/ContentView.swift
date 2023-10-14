//
//  ContentView.swift
//  KeyboardTypes
//
//  Created by Siddharth Kothari on 13/10/23.
//

import SwiftUI
// https://holyswift.app/discovering-all-swiftui-textfield-keyboard-types/

struct ContentView: View {
    @State private var myText = ""
    let textPlaceholder = "Text Placeholder"
    var body: some View {
        List {
            VStack(spacing: 15) {
                
                Text("Alphabetical")
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    AsciiCapable(myText: $myText)
                    
                    VStack(alignment: .leading) {
                        Text("numbersAndPunctuation")
                        TextField(textPlaceholder, text: $myText)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("URL")
                        TextField(textPlaceholder, text: $myText)
                            .keyboardType(.URL)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("twitter")
                        TextField(textPlaceholder, text: $myText)
                            .keyboardType(.twitter)
                    }
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("namePhonePad")
                        TextField(textPlaceholder, text: $myText)
                            .keyboardType(.namePhonePad)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("websearch")
                        TextField(textPlaceholder, text: $myText)
                            .keyboardType(.webSearch)
                    }
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("emailAddress")
                        TextField(textPlaceholder, text: $myText)
                            .keyboardType(.emailAddress)
                    }
                }
                                
                Text("Num Pads")
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("phonePad")
                        TextField(textPlaceholder, text: $myText)
                            .keyboardType(.phonePad)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("asciiCapableNumberPad")
                        TextField(textPlaceholder, text: $myText)
                            .keyboardType(.asciiCapableNumberPad)
                    }
                }
            }
            .onTapGesture {
                
                UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.endEditing(true)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
