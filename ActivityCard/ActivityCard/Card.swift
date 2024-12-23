//
//  Card.swift
//  ActivityCard
//
//  Created by Siddharth Kothari on 23/12/24.
//

import SwiftUI

struct Card: View {
    let icon: String
    let title: String
    let backgroundColour: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Image(systemName: icon)
                .font(.system(size: 25))
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            Text(title)
                .font(.headline)
        }
        .padding(10)
        .padding(.vertical, -3)
        .foregroundStyle(backgroundColour)
    }
}

#Preview {
    Card(icon: "pencil", title: "Pencil", backgroundColour: .blue)
}
