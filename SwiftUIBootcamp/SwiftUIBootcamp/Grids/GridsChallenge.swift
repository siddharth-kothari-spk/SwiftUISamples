//
//  GridsChallenge.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 03/03/24.
//

import SwiftUI

struct GridsChallenge: View {
    let columns: [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
        .init(.flexible())
    ]
    
    let foods : [String] = [
        "food1",
        "food2",
        "food3",
        "food4",
        "food5",
        "food6",
        "food7",
        "food8",
        "food9",
        "food10"]
    
    let dimension = (UIScreen.main.bounds.width / 3) - 2
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 2, content: {
                ForEach(foods, id: \.self) { food in
                    Image(food)
                        .resizable()
                        .scaledToFill()
                        .frame(width: dimension, height: dimension)
                        .clipShape(Rectangle())
                }
               
            })
            .padding(.horizontal, 2)
        }
    }
}

#Preview {
    GridsChallenge()
}
