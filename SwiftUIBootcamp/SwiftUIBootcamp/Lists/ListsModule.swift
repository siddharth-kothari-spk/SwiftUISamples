//
//  ListsModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 03/03/24.
//

import SwiftUI

struct ListsModule: View {
    var body: some View {
        List {
            ForEach(0...100, id: \.self) { index in
                Text("Index \(index)")
            }
        }
    }
}

#Preview {
    ListsModule()
}
