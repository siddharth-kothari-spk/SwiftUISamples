//
//  ContentView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 17/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Image(systemName: "cellularbars")
                .foregroundColor(Color("AccentColor"))
                .imageScale(.large)
                .foregroundStyle(.tint)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Drag and drop the view for multiline text with some random data")
                .multilineTextAlignment(.center)
            Button("Test button") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
            .frame(width: 300.0)
            .border(/*@START_MENU_TOKEN@*/Color("AccentColor")/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
        }
        .padding(.all)
    }
}

#Preview {
    ContentView()
}
