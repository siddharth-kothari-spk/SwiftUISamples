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

                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                guard let window = windowScene?.windows.filter({ keyWindow in
                    keyWindow.isKeyWindow
                }).first else { return }
                window.endEditing(true)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
