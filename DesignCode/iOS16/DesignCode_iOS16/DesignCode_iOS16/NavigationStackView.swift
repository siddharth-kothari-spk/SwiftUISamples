//
//  NavigationStackView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 03/09/24.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List(navigationItems) { item in
                    NavigationLink {
                        VStack {
                            Text("ID: \(item.id)")
                                .padding(8)
                                .multilineTextAlignment(.center)
                            Image(systemName: item.icon)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .font(.largeTitle)
                        }
                        .padding()
                    } label: {
                        Label(item.title, systemImage: item.icon)
                            .foregroundStyle(.primary)
                    }
                    .navigationTitle("navigation1")
                    .navigationBarTitleDisplayMode(.inline)
                    .listStyle(.plain)
                }
                
                List(navigationItems) { item in
                    NavigationLink(value: item) {
                        Label(item.title, systemImage: item.icon)
                    }
                }
                .navigationDestination(for: NavigationItem.self) { item in
                    VStack {
                        
                        switch item.menu {
                        case .trash:
                            Text("ID: \(item.id)")
                                .padding(8)
                                .multilineTextAlignment(.center)
                        
                        case .pencil:
                            Image(systemName: item.icon)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.accent)
                        
                        case .eraser:
                            Text("ID: \(item.id)")
                                .padding(8)
                                .multilineTextAlignment(.center)
                        
                        case .lasso:
                            Image(systemName: item.icon)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.accent)
                        
                        case .folder:
                            Text("ID: \(item.id)")
                                .padding(8)
                                .multilineTextAlignment(.center)
                        
                        }
                        
                        Text("ID: \(item.id)")
                            .padding(8)
                            .multilineTextAlignment(.leading)
                        Image(systemName: item.icon)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.accent)
                        
                    }
                }
                .navigationTitle("navigation2")
                //.navigationBarTitleDisplayMode(.large)
                .listStyle(.grouped)
                
            }
        }
    }
}

#Preview {
    NavigationStackView()
}
