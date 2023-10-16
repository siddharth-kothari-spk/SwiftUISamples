//
//  ContentView.swift
//  ThreadsUI
//
//  Created by Siddharth Kothari on 16/10/23.
//

// courtsey: https://www.swiftjectivec.com/meta-threads-ios-interface-in-swiftui/

import SwiftUI

private let symbols: [String] = [
    "square.and.pencil.circle.fill",
    "calendar.badge.plus",
    "square.and.arrow.up.circle.fill",
    "book.circle",
    "pencil.tip.crop.circle.badge.plus",
    "apple.logo",
    "network.badge.shield.half.filled",
    "figure.snowboarding",
    "cloud.sun.rain.fill",
    "circle.lefthalf.fill",
    "lock.applewatch",
    "staroflife.circle.fill"
]

private let columnLayout = Array(repeating: GridItem(), count: 3)

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
                        .offset(x: item == "CD" ? -10 : 0)
                        .offset(x: item == "EF" ? -20 : 0)
                }
                
                Text("1.2 mil followers · rickroll.net/about")
                    .fontWeight(.medium)
                    .foregroundStyle(Color(uiColor: .secondaryLabel))
                    .offset(x: -10)
                
                Spacer()
            }
            .font(.system(size: 12))
            .padding(.bottom, 16)
            
            // edit/share profile
            HStack {
                Button("Edit profile") {
                    print("edit profile tapped")
                }
                .frame(width: 160, height: 44, alignment: .center)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color(uiColor: .systemGray5), lineWidth: 1)
                        .foregroundColor(Color.white)
                }
                
                Spacer()
                
                Button("Share profile") {
                    print("share profile tapped")
                }
                .frame(width: 160, height: 44)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 8).strokeBorder(Color(uiColor: .systemGray5), lineWidth: 1)
                }
            }
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .padding(.bottom, 16)
            
            // favourite/replies
            HStack {
                Text("Favorites")
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 16)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .frame(height: 1)
                        
                    }
                Text("Replies")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(uiColor: .tertiaryLabel))
            }
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .padding(.bottom, 16)
            
           // scroll view
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(symbols, id: \.self) { index in
                        Button {
                            print("\(index) clicked")
                        } label: {
                            Image(systemName: index)
                                .font(.largeTitle)
                                .padding()
                        }
                        .buttonStyle(.plain)
                        .contentShape(ContentShapeKinds.contextMenuPreview, Circle())
                        .contextMenu {
                            Button {
                                print("context menu clicked: \(index)")
                            } label: {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }

                        }
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .padding()
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
