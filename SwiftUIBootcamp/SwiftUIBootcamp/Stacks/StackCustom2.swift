//
//  StackCustom2.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 29/02/24.
//

import SwiftUI

struct StackCustom2: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 10) {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 400)
                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 300)
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 200)
            }
            
            HStack(alignment: .top, spacing: 10) {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 100, height: 400)
                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 300)
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 200)
            }
        }
    }
}

#Preview {
    StackCustom2()
}
