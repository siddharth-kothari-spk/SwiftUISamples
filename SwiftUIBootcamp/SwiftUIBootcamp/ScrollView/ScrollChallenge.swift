//
//  ScrollChallenge.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 02/03/24.
//

import SwiftUI

struct ScrollChallenge: View {
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Delicious food awaits")
                .font(.title)
                .fontWeight(.heavy)
            
            ScrollView {
                ForEach(foods, id: \.self) { food in
                    VStack(alignment: .leading, spacing: 25) {
                        Image(food)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 360, height: 200)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Dish: \(food)")
                                .font(.headline)
                            .fontWeight(.semibold)
                            
                            Text("Available for delivery")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollChallenge()
}
