//
//  ContentView.swift
//  MatchedGeometryEffect
//
//  Created by Siddharth Kothari on 05/12/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-matchedgeometryeffect-httpslnkdin-activity-7269703769708204032-hwh8/
import SwiftUI

struct ContentView: View {
    @State private var state: SegmentedControlState = .option1
    @Namespace private var segmentedControl
    var body: some View {
        HStack {
            ForEach(SegmentedControlState.allCases, id: \.self) { item in
                Text(item.rawValue)
                    .padding(10)
                    .foregroundStyle(state == item ? .black : .gray)
                    .matchedGeometryEffect(id: item, in: segmentedControl)
                    .onTapGesture(perform: {
                        withAnimation {
                            self.state = item
                        }
                    })
            }
        }
        .padding(6)
        .background {
            Capsule()
                .fill(.gray.tertiary)
                .overlay {
                    Capsule()
                        .fill(.gray.tertiary)
                        .matchedGeometryEffect(id: state, in: segmentedControl, isSource: false)
                }
        }
    }
}

#Preview {
    ContentView()
}

enum SegmentedControlState: String, CaseIterable {
    case option1 = "Home"
    case option2 = "Notifications"
    case option3 = "Settings"
}
