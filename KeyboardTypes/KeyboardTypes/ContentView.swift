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
            
            AsciiCapable(myText: $myText)
            
            NumbersAndPunctuation(myText: $myText)
            
            URL(myText: $myText)

            Twitter(myText: $myText)
            
            NamePhonePad(myText: $myText)
            
            WebSearch(myText: $myText)
            
            Email(myText: $myText)
            
            PhonePad(myText: $myText)
            
            AsciiCapableNumberPad(myText: $myText)
            
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
