//
//  ListsModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 03/03/24.
//

import SwiftUI

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

struct ListsModule: View {
    var body: some View {
        List {
            Section {
                ForEach(0...5, id: \.self) { index in
                    Text("Index \(index)")
                }
            }
            
            Section {
                ForEach(foods, id: \.self) { food in
                    Text(food)
                }
            }
            
            Section {
                ForEach(foods, id: \.self) { food in
                    Image(food)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 360, height: 200)
                }
            }
        }
    }
}

#Preview {
    ListsModule()
}
