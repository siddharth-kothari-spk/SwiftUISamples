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
            
            Text("Hello, world!".localizedCapitalized)
                .font(.largeTitle.width(.condensed)) // A width to use for fonts that have multiple widths
                .fontWeight(.bold)
            
            Text("Drag and drop the view for multiline text with some random data")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary) // for vibrancy (Glossary A)
                .fontWeight(.medium)
            
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
                    .background(.blue.opacity(0.8).gradient)
                    .background(
                        RoundedRectangle(cornerRadius: 10) // this covers whole background
                            .stroke(lineWidth: 5.0)
                           // .foregroundColor(.secondary) // for vibrancy (Glossary A)
                            .foregroundStyle(.linearGradient(colors: [.red.opacity(0.5), .yellow.opacity(0.5), .red.opacity(0.5), .yellow.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)) // gradient
                    )
            })
            .tint(.primary) // applies color to all elements inside button
           // .shadow(color: .green, radius: 10) // adding contrast by shadow. shadow might not be properly visibile due to view background opacity
        }
        .padding(30)
        .background(.ultraThinMaterial) // check Material enum
       // .background(RoundedRectangle(cornerRadius: 10).stroke()) // goes to backside
        // we need overlay to come on top
        .overlay(content: {
            RoundedRectangle(cornerRadius: 10)
                .stroke()
                .foregroundStyle(.linearGradient(colors: [.white.opacity(0.2), .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
        })
        .shadow(color: .green.opacity(0.6), radius: 20, y: 20) // adding contrast by shadow
        .padding(10)
    }
}

#Preview {
    ContentView()
        .background(Image("Wallpaper 4"))
}


// Glossary
// A. vibrancy refers to how our text seems to be of different color based on background. For this we keep foreground style as secondary and now based on background image (Material enum) it changes appearance
