//
//  CustomCollectionView.swift
//  Custom_Collection_View
//
//  Created by Siddharth Kothari on 04/05/24.
//

import SwiftUI
import UIKit

/*
 1. Find out the width for each item String
 2. Create a new itemsArranged: [[String]] being the items above arranged into rows of columns.
 3. ScrollView + LazyVStack + HStack to display the itemsArranged above!
 */
extension String {
    // This function will calculate the width of a String based on the font we specified.
    func width(font: UIFont) -> CGFloat {
        let constraintRectangle = CGSize(width: .greatestFiniteMagnitude, height: 0.0)
        let boundingBox = self.boundingRect(with: constraintRectangle, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }
}

struct CustomCollectionView: View {
    let items: [String]
    @State private var itemsArranged: [[String]] = []
    
    var horizontalSpacing: CGFloat = 10
    var horizontalPadding: CGFloat = 16
    var font: UIFont = UIFont.systemFont(ofSize: 18)

    var body: some View {
// We will be displaying using ScrollView + LazyVStack + HStack. Also, in order for us to have a dynamic containerWidth(ie: based on the context the CollectionView will be used in), instead of passing it in as a parameter or hard coding it, we will be reading from GeometryReader.
        
        GeometryReader { geometry in
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    
                    ForEach(0..<itemsArranged.count, id: \.self) { row in
                        
                        let itemsInRow = itemsArranged[row]
                        HStack(spacing: horizontalSpacing) {
                            ForEach(0..<itemsInRow.count, id: \.self) { column in
                                
                                Text(itemsInRow[column])
                                    .lineLimit(1)
                                    .font(Font(font))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, horizontalPadding)
                                    .foregroundStyle(Color.white)
                                    .background(RoundedRectangle(cornerRadius: 16))
                                    
                            }

                        }
                        
                    }

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .onAppear {
                    itemsArranged = arrangeItems(items, containerWidth: geometry.size.width, font: font, horizontalSpacing: horizontalSpacing, horizontalPadding: horizontalPadding)
                }
            }
            
        }
    }
    
    /*
     let’s write out our algorithm for creating itemsArranged.

     In addition to the item width, there are also couple parameters that will affect how our items fit into one row.

         Obviously, the row width (or the containerWidth of our CollectionView)
         horizontalSpacing: This is the spacing of the HStack for each row
         horizontalPadding: the horizontal padding for the Text
     */
    func arrangeItems(_ items: [String], containerWidth: CGFloat, font: UIFont, horizontalSpacing: CGFloat, horizontalPadding: CGFloat) -> [[String]] {
        
        var arrangeItems: [[String]] = []
        
        var currentRowWidth: CGFloat = 0
        
        for i in 0..<items.count {
            let item = items[i]
            let itemWidth = item.width(font: font) + horizontalPadding * 2
            
            print(itemWidth, "   ", currentRowWidth)
            // first item
            if i == 0 {
                arrangeItems.append([item])
                currentRowWidth = itemWidth
                continue
            }
            
            if currentRowWidth + horizontalSpacing + itemWidth > containerWidth {
                // start new row
                arrangeItems.append([item])
                currentRowWidth = itemWidth
            } else {
                // add to current row
                arrangeItems[arrangeItems.count - 1].append(item)
                currentRowWidth = currentRowWidth + horizontalSpacing + itemWidth
            }

        }

        return arrangeItems
    }
}

#Preview {
    let items: [String] = ["item 1", "item 2 - long long long long long long", "item 3", "item 4", "item 5", "item 6", "item 7 - medium", "item 8"]
    return CustomCollectionView(items: items)
        .padding(.all, 20)
        .background(Color(UIColor.lightGray))
        .padding(.all, 20)
}
