//
//  ImagesModule.swift
//  SwiftUIBootcamp
//
//  Created by Siddharth Kothari on 28/02/24.
//

import SwiftUI

struct ImagesModule: View {
    var body: some View {
        VStack {
            Image(systemName: "play.square.stack")
                .resizable(resizingMode: .tile)
                .frame(width: 200, height: 200)// this alone does not affect size of image , we need to use resizable for that
                .foregroundStyle(.indigo)
                .font(.largeTitle)
                .imageScale(.large)
            .padding()
            
            Image("photo1")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .clipped()
                .clipShape(Capsule(style: .continuous))
        }
    }
}

#Preview {
    ImagesModule()
}
