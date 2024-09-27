//
//  RadialLayoutView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 27/09/24.
//

import SwiftUI

struct RadialLayoutView: View {
    var body: some View {
        HStack {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Circle()
                    .frame(width: 44)
                    .overlay {
                        Image(systemName: "calendar")
                            .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    RadialLayoutView()
}
