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
                Text("Votes extra width column")
                    .gridColumnAlignment(.trailing) // we can set alignment for particular columns
                    .gridCellColumns(2) // view that acts as a cell in a grid to span the specified number of columns.
                Text("Rating")
                    .gridColumnAlignment(.trailing)
            }
            .font(.footnote)
            .foregroundStyle(.blue.opacity(0.5))
            
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            GridRow {
                Text("15")
                    .frame(width: 30, alignment: .trailing)
                ProgressView(value: 0.15)
                   // .gridCellUnsizedAxes(.horizontal) // so now cell takes min instead of max space but follows size of the respective column
                    .frame(maxWidth: 250)
                RatingView(rating: 1)
            }
            
            GridRow {
                Text("32")
                ProgressView(value: 0.32)
                   // .gridCellUnsizedAxes(.horizontal) // so now cell takes min instead of max space but follows size of the respective column
                    .frame(maxWidth: 250)
                RatingView(rating: 2)
            }
            
            GridRow {
                Text("49")
                ProgressView(value: 0.49)
                   // .gridCellUnsizedAxes(.horizontal) // so now cell takes min instead of max space but follows size of the respective column
                    .frame(maxWidth: 250)
                RatingView(rating: 3)
            }
            
            GridRow {
                Text("67")
                ProgressView(value: 0.67)
                   // .gridCellUnsizedAxes(.horizontal) // so now cell takes min instead of max space but follows size of the respective column
                    .frame(maxWidth: 250)
                RatingView(rating: 4)
            }
            
            GridRow {
                Text("89")
                ProgressView(value: 0.89)
                   // .gridCellUnsizedAxes(.horizontal) // so now cell takes min instead of max space but follows size of the respective column
                    .frame(maxWidth: 250)
                RatingView(rating: 5)
            }
        }
        .padding()
    }
}

#Preview {
    GridView()
}

struct RatingView: View {
    var rating: Int = 2
    var items: [Int] = [1,2,3,4,5]
    var body: some View {
        HStack(spacing: 0) {
            ForEach(items, id: \.self) { item in
                Image(systemName: item <= rating ? "star.fill" : "star")
            }
        }
    }
}
