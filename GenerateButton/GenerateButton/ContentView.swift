//
//  ContentView.swift
//  GenerateButton
//
//  Created by Siddharth Kothari on 18/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-swift-iosdeveloper-activity-7263896723029204992-G8RH/?utm_source=share&utm_medium=member_ios

import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            
            ZStack {
                VStack {
                    ZStack {
                        Capsule()
                            .frame(width: 160, height: 55)
                        .foregroundStyle(RadialGradient(colors: show ? [.orange, .white] : [.gray.opacity(0.2)], center: .bottom, startRadius: 20, endRadius: 10))
                        .shadow(color: show ? .orange : .black, radius: show ? 30 : 0, x: 1, y: 3)
                        .padding()
                        
                        Label("Generate", systemImage: "wand.and.stars.inverse")
                            .bold()
                            .foregroundStyle(show ? .white : .gray)
                    }
                    
                    ZStack {
                        Capsule()
                            .frame(width: 160, height: 55)
                        .foregroundStyle(RadialGradient(colors: show ? [.red, .white] : [.gray.opacity(0.2)], center: .bottom, startRadius: 10, endRadius: -10))
                        .shadow(color: show ? .red : .black, radius: show ? 10 : 0, x: 3, y: 1)
                        .padding()
                        
                        Label("Generate", systemImage: "wand.and.stars.inverse")
                            .bold()
                            .foregroundStyle(show ? .black : .white)
                    }
                }
            }
        }
        .onTapGesture(perform: {
            withAnimation {
                show.toggle()
            }
        })
    }
}

#Preview {
    ContentView()
}
