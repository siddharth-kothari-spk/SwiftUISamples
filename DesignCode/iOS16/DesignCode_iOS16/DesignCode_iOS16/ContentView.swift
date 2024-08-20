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
            Image(systemName: "cellularbars", variableValue: 0.5)
                .foregroundColor(Color("AccentColor"))
                .imageScale(.large)
                .foregroundStyle(.tint)
                .font(.system(size: 50))
                .fontWeight(.thin)
            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Drag and drop the view for multiline text with some random data")
                .multilineTextAlignment(.center)
            // Currently button is only tappable where text is present but not on entire width. To resolve it we will use different variation of Button where we can add Text view inside it and then apply all modifiers on it.
            
            // Before:
            /*
             Button("Test button") {
                     /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
             }
             .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
             .frame(width: 300.0)
             .border(/*@START_MENU_TOKEN@*/Color("AccentColor")/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
             */
            
            // After:
            Button(action: {
                
            }, label: {
                Text("Test Button")
                    .padding(.all, 10.0)
                    .frame(maxWidth: .infinity) // done so that fix width doesn't create issue on diff devices like watch and iPad
                    //.border(Color("AccentColor"), width: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 10) // this covers whole background
                            .stroke(lineWidth: 1.0)
                    )
            })
            .tint(.black) // applies color to all elements inside button
        }
        .padding(30)
        .background(Color("Background"))
       // .background(RoundedRectangle(cornerRadius: 10).stroke()) // goes to backside
        // we need overlay to come on top
        .overlay(content: {
            RoundedRectangle(cornerRadius: 10).stroke()
        })
        .padding(10)
    }
}

#Preview {
    ContentView()
}
