//
//  TextView.swift
//  HiddenTextAnimation
//
//  Created by Siddharth Kothari on 22/11/24.
//

import SwiftUI

struct TextView: View {
    var text:String
    var show: Bool
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundStyle(.red)
            .overlay(alignment: .trailing) {
                Rectangle()
                    .foregroundStyle(.green)
                    .frame(maxWidth: show ? 0 : .infinity)
            }
    }
}

#Preview {
    TextView(text: "Test123456789", show: false)
}
