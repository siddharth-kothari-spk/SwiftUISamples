//
//  BottomToTopFill.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

/*
 This is a very basic loader. Create a circle inside the ZSack and then create a Rectangle.

 The size of the circle and rectangle should be the same.

 Initially the offset of the rectangle will be the size of the Circle. When the view appears change the offset to 0 and apply linear animation and make it repeat forever and then you will get the following animation.
 */
import SwiftUI

struct BottomToTopFill: View {
    @State var offset: CGFloat = 80
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.clear)
                .frame(width: 80, height: 80)
                .overlay {
                    Circle()
                        .stroke(.black)
                }
            
            Rectangle()
                .fill(.black)
                .frame(width: 80, height: 80)
                .offset(y: offset)
        }
        .clipShape(.circle)
        .animation(
            Animation.linear(duration: 3)
                .repeatForever(autoreverses: true),
            value: offset
        )
        .onAppear {
            offset = 0
        }
    }
}

#Preview {
    BottomToTopFill()
}
