//
//  DemoAnimation1.swift
//  Animations
//
//  Created by Siddharth Kothari on 03/03/24.
//

import SwiftUI

struct DemoAnimation1: View {

    @State var buttonIsMoved = false

    var body: some View {
        ZStack {

            VStack {
                VStack {
                    
                    Button(action: {
                        self.buttonIsMoved.toggle()
                    }) {
                        Text("This is a button")
                            .foregroundColor(.black)
                            .padding(16)
                            .background(Color.green)
                            .frame(width: buttonIsMoved ? 150 : UIScreen.main.bounds.size.width, height: buttonIsMoved ? 60 : 90)
                    }
                      
                    if buttonIsMoved{
                        
                            Image(systemName: "arrow.up.to.line")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .frame(height: 50)
                                .foregroundColor(.white)
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 30,height: 30)
                            .overlay(content: {
                                Text("1")
                            })
                        Text("Open your UPI app chechk this")
                            .foregroundStyle(.white)
                            .padding([.leading,.trailing],10)
                            .padding(.bottom,20)
                        
                        Image(systemName: "arrow.up.to.line")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .frame(height: 50)
                            .foregroundColor(.white)
                        Circle()
                            .fill(.white)
                            .frame(width: 30,height: 30)
                            .overlay(content: {
                                Text("2")
                            })
                        Text("Approve the payment request")
                            .foregroundStyle(.white)
                            .frame(width: UIScreen.main.bounds.size.width)
                            .padding([.leading,.trailing],10)
                            .padding(.bottom,20)
                        
                        Circle()
                            .fill(.white)
                    }
                }
                .background(.red)
            }
            .animation(.easeInOut, value: 1000)

        }
    }
}

#Preview {
    DemoAnimation1()
}
