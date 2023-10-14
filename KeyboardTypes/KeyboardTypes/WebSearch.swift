//
//  WebSearch.swift
//  KeyboardTypes
//
//  Created by Siddharth Kothari on 14/10/23.
//

import SwiftUI

struct WebSearch: View {
    @Binding var myText: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("websearch")
            TextField("websearch", text: $myText)
                .keyboardType(.webSearch)
        }
    }
}

//#Preview {
//    WebSearch()
//}
