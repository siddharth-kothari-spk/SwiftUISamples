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
    @State private var isIndexSectionExpanded: Bool = false
    @State private var isFoodNameSectionExpanded: Bool = false
    @State private var isFoodImageSectionExpanded: Bool = false

    var body: some View {
        List {
            Section("Index with index position", isExpanded: $isIndexSectionExpanded) {
                ForEach(0...5, id: \.self) { index in
                    Text("Index \(index)")
                }
            }
            
            Section("Food name list", isExpanded: $isFoodNameSectionExpanded) {
                ForEach(foods, id: \.self) { food in
                    Text(food)
                }
            }
            
            Section("Food image", isExpanded: $isFoodImageSectionExpanded) {
                ForEach(foods, id: \.self) { food in
                    Image(food)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 360, height: 200)
                }
            }
        }
        .listStyle(.sidebar)
        // https://stackoverflow.com/a/77266404 sidebar issue
    }
}

#Preview {
    ListsModule()
}
