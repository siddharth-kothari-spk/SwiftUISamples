//
//  RadialLayoutView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 27/09/24.
//

import SwiftUI

struct RadialLayoutView: View {
    var icons = ["calendar", "message", "figure", "pencil.circle.fill"]
    var numbers = [12,1,2,3,4,5,6,7,8,9,10,11]
    
    @State var isRadial = true
    @State var hour: Double = 0
    @State var minute: Double = 0
    
    var body: some View {
        let layout = isRadial ? AnyLayout(RadialLayout()) : AnyLayout(CustomLayout())
        ZStack {
            
            Rectangle()
                .fill(.gray)
           
           // adding clock case
           clockCase
            
            layout {
                ForEach(icons, id:\.self) { item in
                    Circle()
                        .frame(width: 44)
                        .foregroundStyle(.black)
                        .overlay {
                            Image(systemName: item)
                                .foregroundStyle(.white)
                    }
                }
            }
            .frame(width: 120)
            
            layout {
                ForEach(numbers, id: \.self) { item in
                    Text("\(item)")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    .foregroundStyle(.black)
                    .offset(x: isRadial ? 0 : 50)
                }
            }
            .frame(width: 240)
            
            layout {
                ForEach(numbers, id: \.self) { item in
                    Text("\(item * 5)")
                        .font(.system(.caption2, design: .rounded))
                        .foregroundStyle(.black)
                        .offset(x: isRadial ? 0 : 100)
                }
            }
            .frame(width: 360)
            
            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: 5, dash: [1, 12])) // returns ChartSymbolShape
                //.stroke(style: StrokeStyle(lineWidth: 10, dash: [1, 12])) // returns Shape
                .frame(width: 220)
            
            Circle()
                //.strokeBorder(style: StrokeStyle(lineWidth: 5, dash: [1, 12])) // returns ChartSymbolShape
                .stroke(style: StrokeStyle(lineWidth: 10, dash: [1, 12])) // returns Shape
                .frame(width: 280)
           
            // adding clock hands
            clockHands
        
        }
        .onAppear(perform: {
            hour = 360
            minute = 360
        })
        .onTapGesture {
            withAnimation {
                isRadial.toggle()
            }
        }
    }
    
    var clockCase: some View {
        ZStack {
            Circle()
                .foregroundStyle(
                    .green
                        .shadow(.inner(color: .yellow, radius: 30, x: 30, y: 30))
                        .shadow(.inner(color: .blue, radius: 0, x: 1, y: 1)) // blue thin line top left
                        .shadow(.inner(color: .red, radius: 0, x: -1, y: -1)) // red thin line bottom right
                )
                .frame(width: 360)
            
            Circle()
                .foregroundStyle(
                    .red
                        .shadow(.inner(color: .blue, radius: 30, x: -30, y: -30))
                        .shadow(.drop(color: .orange.opacity(0.2), radius: 30, x: 30, y: 30))
                )
                .frame(width: 320)
            
            Circle()
                .foregroundStyle(.white.shadow(.inner(color: .gray, radius: 30, x: 30, y: 30)))
                .frame(width: 300)
                //.foregroundStyle(.red.shadow(.inner(color: .blue.opacity(0.5), radius: 30, x: 50, y: 150)))
                //.foregroundStyle(.red.shadow(.drop(color: .blue, radius: 30, x: 30, y: 30)))
        }
    }
    
    var clockHands: some View {
        ZStack(content:{
            // hour hand
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(.black)
                .frame(width: 8, height: 70)
                .overlay {
                    // to show hand prominenetly
                    RoundedRectangle(cornerRadius: 4).stroke().fill(.white)
                }
                .offset(y: -30) // to put in center
                .rotationEffect(Angle(degrees: hour))
                .shadow(radius: 5, y: 5)
                .animation(.linear(duration: 60), value: hour)
            
            // minute hand
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(.black)
                .frame(width: 8, height: 100)
                .overlay {
                    // to show hand prominenetly
                    RoundedRectangle(cornerRadius: 4).stroke().fill(.white)
                }
                .offset(y: -45) // to put in center
                .rotationEffect(Angle(degrees: minute))
                .shadow(radius: 5, y: 5)
                .animation(.linear(duration: 10).repeatCount(12, autoreverses: false), value: minute)
            
            // pin for minute and hour hand
            Circle()
                .fill(.red)
                .frame(width: 10)
        })
    }
}

#Preview {
    RadialLayoutView()
}

struct CustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
        /// Use the default value to prevent a flexible view from disappearing
        /// into a zero-sized frame, and ensure the unspecified value remains
        /// visible during debugging.
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subView) in subviews.enumerated() {
            
            // position
            var point = CGPoint(x: 15 * index, y: 15 * index)
                .applying(CGAffineTransform(rotationAngle:  CGFloat(5 * index + 5)))
            
            // center
            point.x += bounds.midX
            point.y += bounds.midY
            
            subView.place(at: point,
                          anchor: .center,
                          proposal: .unspecified)
        }
    }
}

struct RadialLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
        /// Use the default value to prevent a flexible view from disappearing
        /// into a zero-sized frame, and ensure the unspecified value remains
        /// visible during debugging.
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        let radius = bounds.width / 3.0
        let angle = Angle.degrees(360.0 / Double(subviews.count)).radians
        
        for (index, subView) in subviews.enumerated() {
            
            // position
            var point = CGPoint(x: 0, y: -radius)
                .applying(CGAffineTransform(rotationAngle: angle * Double(index)))
            
            // center
            point.x += bounds.midX
            point.y += bounds.midY
            
            subView.place(at: point,
                          anchor: .center,
                          proposal: .unspecified)
        }
    }
    
}
