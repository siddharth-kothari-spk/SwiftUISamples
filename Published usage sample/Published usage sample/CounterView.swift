//
//  CounterView.swift
//  Published usage sample
//
//  Created by Siddharth Kothari on 29/09/23.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var counter = Counter() // marked this property as an observable object, meaning that any changes to its @Published properties will trigger an update in the view.
    
    var body: some View {
        VStack {
            Text("Counter: \(counter.count)").font(.largeTitle) // current value of the counter
            
            HStack {
                Button("Increment") {
                    counter.increment()
                }.padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(10.0)
                
                Button("Decrement") {
                    counter.decrement()
                }.padding()
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10.0)
                
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
