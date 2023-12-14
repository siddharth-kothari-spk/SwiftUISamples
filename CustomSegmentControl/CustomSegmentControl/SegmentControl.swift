//
//  SegmentControl.swift
//  CustomSegmentControl
//
//  Created by Siddharth Kothari on 14/12/23.
//

import SwiftUI

struct SegmentControl: View {
    @Binding var selectedIndex: Int
    let options: [SegmentControlItem]
    
    public var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 6.0)
                    .foregroundColor(.white)
                    .cornerRadius(6.0)
                    .padding(4)
                    .frame(width: geo.size.width / CGFloat(options.count))
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
                    .offset(x: geo.size.width / CGFloat(options.count) * CGFloat(selectedIndex), y: 0)
            }
            .frame(height: 40)
            
            HStack(spacing: 0) {
                ForEach((0..<options.count), id: \.self) { index in
                    HStack(spacing: 6) {
                        if let iconString = options[index].iconString {
                            Image(systemName: iconString)
                        }
                        if let name = options[index].name {
                            Text(name)
                        }
                    }
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.00001))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.150)) {
                            selectedIndex = index
                        }
                    }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 6.0)
                .fill(Color.black.opacity(0.05))
        )
    }
}
