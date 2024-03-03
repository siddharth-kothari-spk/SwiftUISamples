//
//  ListsModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 03/03/24.
//

import SwiftUI

struct ListsModule: View {
    @State private var isIndexSectionExpanded: Bool = false
    @State private var isFoodNameSectionExpanded: Bool = true
    @State private var isFoodImageSectionExpanded: Bool = false
    
    @State var foods : [String] = [
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
                .onDelete(perform: { indexSet in
                    foods.remove(atOffsets: indexSet)
                })
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
