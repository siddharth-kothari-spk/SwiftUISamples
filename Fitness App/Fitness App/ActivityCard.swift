//
//  ActivityCard.swift
//  Fitness App
//
//  Created by Siddharth Kothari on 18/08/23.
//

import SwiftUI

struct ActivityCard: View {
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Daily Steps")
                            .font(.system(size: 16))
                        Text("Goal: 10000")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "figure.walk").foregroundColor(.green)
                }
                .padding()
                
                Text("5000").font(.system(size: 24))
            }
        .cornerRadius(15)
        }
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard()
    }
}
