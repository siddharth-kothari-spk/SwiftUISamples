//
//  StackChallenge.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 29/02/24.
//

import SwiftUI

struct StackChallenge: View {
    var body: some View {
        VStack(content: {
            Text("without divider")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 16) {
                // alignment is leading here but items do not move to left as the width is limited by HStack contents, but Divider() goes across the screen
                HStack {
                    Image("photo2")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, content: {
                        Text("headline text")
                            //.frame(width: 100, height: 40)
                            .font(.headline)
                            .foregroundStyle(.blue)
                        
                        Text("Sub headline test")
                           // .frame(width: 100, height: 40)
                            .font(.subheadline)
                            .foregroundStyle(.green)
                    })
                    Spacer()
                    Image(systemName: "paperplane")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                
                HStack {
                    Image("photo2")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, content: {
                        Text("headline text")
                            //.frame(width: 100, height: 40)
                            .font(.headline)
                            .foregroundStyle(.blue)
                        
                        Text("Sub headline test")
                           // .frame(width: 100, height: 40)
                            .font(.subheadline)
                            .foregroundStyle(.green)
                    })
                    Spacer()
                    Image(systemName: "paperplane")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
            
            
            Text("with divider")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .leading) {
                HStack {
                    Image("photo2")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, content: {
                        Text("headline text")
                            //.frame(width: 100, height: 40)
                            .font(.headline)
                            .foregroundStyle(.blue)
                        
                        Text("Sub headline test")
                           // .frame(width: 100, height: 40)
                            .font(.subheadline)
                            .foregroundStyle(.green)
                    })
                    Spacer()
                    Image(systemName: "paperplane")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }.padding(16)
                Divider()
                
                HStack {
                    Image("photo2")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, content: {
                        Text("headline text")
                            //.frame(width: 100, height: 40)
                            .font(.headline)
                            .foregroundStyle(.blue)
                        
                        Text("Sub headline test")
                           // .frame(width: 100, height: 40)
                            .font(.subheadline)
                            .foregroundStyle(.green)
                    })
                    Spacer()
                    Image(systemName: "paperplane")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }.padding(16)
                Divider()

            }
            Spacer()
        })

    }
}

#Preview {
    StackChallenge()
}
