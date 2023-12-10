//
//  ContentView.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//


// courtsey: https://blog.stackademic.com/custom-buttons-in-swiftui-6224f87e01f0

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                FillButton()
                BorderButton()
                HStack(content: {
                    IconButton()
                    CircleIconButton()
                })
                TextWithImageButton()
                LinkButton()
                IconButtonWithFullWidth()
            }
            .padding(.all, Constants.customPadding)
        }
        
    }
}

#Preview {
    ContentView()
}
