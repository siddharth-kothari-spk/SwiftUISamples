//
//  GridView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 16/09/24.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid(alignment: .leading, horizontalSpacing: 12.0, verticalSpacing: 15.0) {
            GridRow {
                Text("Votes")
                Text("Percentage")
                Text("Rating")
            }
            GridRow {
                Text("4")
                ProgressView(value: 0.2)
                Image(systemName: "star")
            }
        }
        .padding()
    }
}

#Preview {
    GridView()
}
