//
//  ScrollViewModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 02/03/24.
//

import SwiftUI

struct ScrollViewModule: View {
    
    let photos: [String] = [
        "photo1",
        "photo2",
        "photo3",
        "photo4",
        "photo5",
        "photo6"]
    var body: some View {
        VStack {
            ScrollView(showsIndicators: true) {
                VStack {
                    ForEach(0 ... 20, id: \.self) { index in
                        Text("Hello index: \(index)")
                    }
                }
            }
            .frame(width: 300, height: 200)
            .background(.blue)
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(21 ... 40, id: \.self) { index in
                        Text("Hello index: \(index)")
                    }
                }
            }
            .frame(width: 300, height: 50)
            .background(.red)

        }
    }
}

#Preview {
    ScrollViewModule()
}
