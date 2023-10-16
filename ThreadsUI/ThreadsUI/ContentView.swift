//
//  ContentView.swift
//  ThreadsUI
//
//  Created by Siddharth Kothari on 16/10/23.
//

// courtsey: https://www.swiftjectivec.com/meta-threads-ios-interface-in-swiftui/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // navigation view
            HStack {
                Image(systemName: "globe")
                    .fontWeight(.semibold)
                Spacer()
                Text("Threads UI")
                Spacer()
                Image(systemName: "plus.circle")
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 32)
            
            // About me
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Siddharth Kothari")
                        .font(.system(size: 24, weight: .bold, design: .default))
                    Text("iOS developer")
                        .font(.system(size: 16))
                }
                Spacer()
                Image("Me")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .contextMenu {
                        Button("Change Picture") {
                        }
                    }
            }
            .padding(.bottom, 16)
            
            // intro
            Text("🧑🏻‍💻 Learning ObjectiveC, Swift, SwiftUI, Git, Jira\n📍 India")
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .lineSpacing(10)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 16)
            
            // followers
            HStack(spacing: 0) {
                
                ForEach(["AB", "CD", "EF"], id: \.self) { item in
                    Text(item)
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .padding(6)
                        .background {
                            Circle()
                                .fill(Color.blue)
                                .shadow(radius: 5)
                        }
                }
                
                Text("1.2 mil followers · rickroll.net/about")
                    .fontWeight(.medium)
                    .foregroundStyle(Color(uiColor: .secondaryLabel))
                    .offset(x: -10)
                
                Spacer()
            }
            .font(.system(size: 12))
            .padding(.bottom, 16)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
