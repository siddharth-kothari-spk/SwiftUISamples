//
//  ContentView.swift
//  Popover
//
//  Created by Siddharth Kothari on 18/02/24.
//

import SwiftUI
import Popovers

// courtsey: https://betterprogramming.pub/how-to-add-custom-popovers-to-your-swiftui-ios-app-814bdfad73d0

struct ContentView: View {
    @State var basicPopoverPresent1: Bool = false
    @State var basicPopoverPresent2: Bool = false
    @State var basicPopoverPresent3: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Basic Popovers").padding()
                HStack {
                    Button("Present popover 1") {
                        basicPopoverPresent1 = true
                    }
                    .padding()
                    .popover(present: $basicPopoverPresent1) {
                        Text("Hi, I'm a popover.")
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(16)
                    }
                    
                    Button("Present popover 2") {
                        basicPopoverPresent2 = true
                    }
                    .padding()
                    .border(.green)
                    .popover(
                        present: $basicPopoverPresent2,
                        attributes: {
                            $0.position = .absolute(
                                originAnchor: .top,
                                popoverAnchor: .bottom
                            )
                            $0.sourceFrameInset.top = -16
                        }
                    ) {
                        Text("Hi, I'm a popover that's attached to the button's top, with a bit of spacing.")
                            .frame(maxWidth: 250)
                            .padding()
                            .background(.regularMaterial)
                            .border(.blue)
                    }
                }.padding()
                
                Button("Present popover 3") {
                    basicPopoverPresent3 = true
                }
                .padding()
                .popover(
                    present: $basicPopoverPresent3,
                    attributes: {
                        $0.presentation.animation = .spring(response: 0.6, dampingFraction: 0.4, blendDuration: 1)
                        $0.presentation.transition = .offset(x: 0, y: 30).combined(with: .opacity)
                        $0.dismissal.transition = .offset(x: 0, y: 30).combined(with: .opacity)
                        $0.rubberBandingMode = .yAxis
                    }
                ) {
                    Text("Hi, I'm a bouncy popover!")
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            LinearGradient(colors: [.blue, .green], startPoint: .top, endPoint: .bottom),
                            in: RoundedRectangle(cornerRadius: 16)
                        )
                }
            
        }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
