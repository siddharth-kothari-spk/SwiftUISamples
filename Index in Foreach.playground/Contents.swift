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


// 2. Using indices property
struct ContentView2: View {
    let items = ["Milk", "Bread", "Cookies", "Tea"]

    var body: some View {
        VStack {
            ForEach(items.indices, id: \.self) { index in
                Text("\(index): \(items[index])")
            }
        }
    }
}

/*
 In this example:

     items.indices gives you a range of indices for the items array.
     ForEach uses this range of indices. id: \.self is used to identify each element uniquely.
     Inside the ForEach loop, items[index] is used to access each item using the index.
 */


// 3. Using enumerated() method
struct ContentView3: View {
    let items = ["Milk", "Bread", "Cookies", "Tea"]

    var body: some View {
        VStack {
            ForEach(Array(items.enumerated()), id: \.1) { index, item in
                Text("\(index): \(item)")
            }
        }
    }
}

/*
 In this example:

     enumerated() is used to get a sequence of pairs (index, value) from the items array.
     Array(items.enumerated()) converts the enumerated sequence into an array of tuples.
     ForEach iterates through this array of tuples, where index and item represent the index and value, respectively.
     id: \.1 is used to specify a unique identifier for each row in the ForEach loop. \0 refers to the first element of the tuple (which is the index) and \1 refers to the second element (which is the item).
 */
