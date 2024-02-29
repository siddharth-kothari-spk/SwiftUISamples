//
//  StacksModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 28/02/24.
//

import SwiftUI

struct StacksModule: View {
    var body: some View {
        ScrollView {
            StackBasic()
            StackCustom()
        }
    }
}

#Preview {
    StacksModule()
}
