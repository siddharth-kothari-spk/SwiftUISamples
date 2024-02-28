//
//  TextModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 28/02/24.
//

import SwiftUI

struct TextModule: View {
    var body: some View {
        Text("Hello bootcamp. Multiline text")
            .font(.largeTitle) // view modifier
            .foregroundStyle(.blue)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
            .multilineTextAlignment(.center)
            .italic()
            .underline()
            .strikethrough()
    }
}

#Preview {
    TextModule()
}
