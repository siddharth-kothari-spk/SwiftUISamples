//
//  FirstScreen.swift
//  NavigationStack
//
//  Created by Siddharth Kothari on 25/12/23.
//

import Foundation

import SwiftUI

struct FirstScreen: View {
    let items: [DataModel]
    let selectedItem: String
    
    var body: some View {
        List {
            ForEach(items) { item in
                NavigationLink(item.text, value: item)
            }
        }
        .navigationTitle(selectedItem)
    }
}

#Preview {
    FirstScreen(items: SampleData.firstScreenData, selectedItem: "")
}
