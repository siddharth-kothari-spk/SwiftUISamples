// courtsey: https://gurjit-singh.medium.com/how-to-get-index-in-foreach-in-swiftui-583d7612f47d

import Foundation

/*
 If you need the index of the current element while using ForEach, you can achieve this by using the following ways along with ForEach.

     You can use a Range and iterate through it
     You can use the indices property of a collection
     You can achieve this by using the enumerated() method
 */


// 1. Using Range and count
import SwiftUI

struct ContentView: View {
    let items = ["Milk", "Bread", "Cookies", "Tea"]

    var body: some View {
        VStack {
            ForEach(0..<items.count, id: \.self) { index in
                Text("\(index): \(items[index])")
            }
        }
    }
}

/*
 In this example:

     0..<items.count creates a range of indices from 0 to items.count - 1.
     ForEach uses this range of indices. id: \.self is used to identify each element uniquely.
     Inside the ForEach loop, items[index] is used to access each item using the index.
 */
