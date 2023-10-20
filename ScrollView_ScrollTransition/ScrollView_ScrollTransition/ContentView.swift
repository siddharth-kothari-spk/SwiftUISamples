//
//  ContentView.swift
//  ScrollView_ScrollTransition
//
//  Created by Siddharth Kothari on 20/10/23.
//
// courtsey: https://santoshbotre01.medium.com/elevate-your-apps-user-experience-exploring-scrollview-scrolltransition-api-in-swiftui-with-ios-2c259025fab2

// Developers use the ScrollView design screen by adding children's views into it when it needs scrolling capability.

// // SwiftUI has added a new modifier toScrollView which is scrollTransition(). It allows customising the transition for views to come into and go out of the screen.

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Vertical
            Text("Vertical").font(.largeTitle)
            ScrollView {
                ForEach(Shapes.dummyShapes) { dummyShape in
                    Image(systemName: dummyShape.title)
                      .resizable()
                      .imageScale(.medium)
                      .frame(width: 200,height: 200)
                      .cornerRadius(16)
                      .foregroundColor(dummyShape.color)
                      .padding(.horizontal)
                      .scrollTransition { emptyVisualEffect, scrollTransitionPhase in
                          emptyVisualEffect.scaleEffect(scrollTransitionPhase.isIdentity ? 1 : 0.3)
                              .rotationEffect(.degrees(scrollTransitionPhase.value > 0 ? -90 : 0))
                              .opacity(scrollTransitionPhase.isIdentity ? 1 : 0.01)
                              .blur(radius: scrollTransitionPhase.isIdentity ? 0 : 6)
                        /*  if(scrollTransitionPhase.isIdentity) {
                              .rotation3DEffect(Angle(degrees: 10), axis: (x: 1, y: 1, z: 1))
                          } else {
                              .rotation3DEffect(Angle(degrees: 100), axis: (x: 2, y: 1, z: 1))
                          }*/
                      }
                  }
            }.padding()
            
            // Horizontal
            Text("Horizontal").font(.largeTitle)
            ScrollView(.horizontal) {
                HStack(content: {
                    ForEach(Shapes.dummyShapes) { dummyShape in
                        Image(systemName: dummyShape.title)
                          .resizable()
                          .imageScale(.medium)
                          .frame(width: 80, height:80)
                          .cornerRadius(16)
                          .foregroundColor(dummyShape.color)
                          .padding(.horizontal)
                          .scrollTransition { emptyVisualEffect, scrollTransitionPhase in
                              emptyVisualEffect.scaleEffect(scrollTransitionPhase.isIdentity ? 1 : 0.3)
                                  .rotation3DEffect(Angle(degrees: 25), axis: (x: 2, y: 1, z: 1))
                                  .opacity(scrollTransitionPhase.isIdentity ? 1 : 0.01)
                                  .blur(radius: scrollTransitionPhase.isIdentity ? 0 : 6)
                          }
                      }
                })
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
