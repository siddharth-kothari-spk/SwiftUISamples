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
        VStack(alignment: .leading, spacing: 0) {
            
            Image(systemName: icon)
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            Text(title)
                .font(.headline)
        }
        .padding(10)
        .padding(.vertical, -3)
        .foregroundStyle(backgroundColour)
        .frame(height: 100)
        .background(backgroundColour.opacity(0.2), in: .rect(cornerRadius: 12))
    }
}

#Preview {
    Card(icon: "pencil", title: "Pencil", backgroundColour: .blue)
}
