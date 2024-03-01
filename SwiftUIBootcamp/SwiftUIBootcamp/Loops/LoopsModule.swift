//
//  LoopsModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 01/03/24.
//

import SwiftUI

struct LoopsModule: View {
    let photos: [String] = [
        "photo1",
        "photo2",
        "photo3",
        "photo4",
        "photo5",
        "photo6"]
    var body: some View {
        VStack {
            ForEach(photos, id: \.self) { photo in
               // Text("Index is \(index)")
                HStack {
                    Image(photo)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, content: {
                        Text("headline text: \(photo)")
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
        }
        
    }
}

#Preview {
    LoopsModule()
}
