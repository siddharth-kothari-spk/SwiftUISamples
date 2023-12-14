//
//  ContentView.swift
//  CustomSegmentControl
//
//  Created by Siddharth Kothari on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex1 = 0
    @State var selectedIndex2 = 0
    @State var selectedIndex3 = 0
    
    let options1: [SegmentControlItem] = [
        SegmentControlItem(name: "Car"),
        SegmentControlItem(name: "Bike")
    ]
    
    let options2: [SegmentControlItem] = [
        SegmentControlItem(name: "Car", iconString: "car.fill"),
        SegmentControlItem(name: "Bike", iconString: "bicycle"),
        SegmentControlItem(name: "Bus", iconString: "bus"),
    ]
    
    let options3: [SegmentControlItem] = [
        SegmentControlItem(iconString: "car.fill"),
        SegmentControlItem(iconString: "bicycle"),
        SegmentControlItem(iconString: "bus"),
        SegmentControlItem(iconString: "airplane"),
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            SegmentControl(
                selectedIndex: $selectedIndex1,
                options: options1
            )
            
            SegmentControl(
                selectedIndex: $selectedIndex2,
                options: options2
            )
            
            SegmentControl(
                selectedIndex: $selectedIndex3,
                options: options3
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
