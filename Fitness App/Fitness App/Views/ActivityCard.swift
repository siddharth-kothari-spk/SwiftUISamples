//
//  ActivityCard.swift
//  Fitness App
//
//  Created by Siddharth Kothari on 18/08/23.
//

import SwiftUI

struct ActivityCard: View {
    @State var activity: Activity
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.title)
                            .font(.system(size: 16))
                        Text(activity.subTitle)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: activity.image).foregroundColor(activity.tintColor)
                }
                .padding()
                
                Text(activity.amount).font(.system(size: 24))
                    .padding()
            }
        .cornerRadius(15)
        }
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard(activity: Activity(id: 1, title: "Daily Steps", subTitle: "Goal: 10000", image: "figure.walk", amount: "1234", tintColor: .green))
    }
}
