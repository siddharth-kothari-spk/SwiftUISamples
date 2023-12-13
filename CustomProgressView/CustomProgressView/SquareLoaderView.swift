//
//  SquareLoaderView.swift
//  CustomProgressView
//
//  Created by Siddharth Kothari on 13/12/23.
//

/*
 For making SquareLoaderView, create xOffset, yOffset, and size properties inside it.

     Remember xOffset should be (size/2) and yOffset should be (-size/2)

 Now, create a ZStack, and inside that ZStack, create a Rectangle with given size property above.

 Next, create a circle with .black fill color and offset and put xOffset to x-axis and yOffset to y-axis.

 Now, onAppear we need to run the Timer which will run after every given interval, and manually calculate the xOffset and yOffset as below.
 
 if yOffset == -size/2 && xOffset != -size/2 {
     self.xOffset += -1
 } else if xOffset == -size/2 && yOffset != size/2 {
     self.yOffset += 1
 } else if yOffset == size/2 && xOffset != size/2 {
     self.xOffset += +1
 } else if xOffset == size/2 && yOffset != -size/2 {
     self.yOffset += -1
 }
 
 */
import SwiftUI

struct SquareLoaderView: View {
    @State private var xOffset: CGFloat = 40
    @State private var yOffset: CGFloat = -40
    var size: CGFloat = 80

    var body: some View {
        ZStack {
            Rectangle()
                .stroke(.black, lineWidth: 2)
                .frame(width: size, height: size)

            Circle()
                .fill(.black)
                .frame(width: 10, height: 10)
                .offset(x: xOffset, y: yOffset)
                .onAppear {
                    let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                        withAnimation {
                            if yOffset == -size/2 && xOffset != -size/2 {
                                self.xOffset += -1
                            } else if xOffset == -size/2 && yOffset != size/2 {
                                self.yOffset += 1
                            } else if yOffset == size/2 && xOffset != size/2 {
                                self.xOffset += +1
                            } else if xOffset == size/2 && yOffset != -size/2 {
                                self.yOffset += -1
                            }
                        }
                    }
                    RunLoop.current.add(timer, forMode: .common)
                }
        }
    }
}

#Preview {
    SquareLoaderView()
}
