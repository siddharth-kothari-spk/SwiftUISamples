//
//  CardReflectionView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 13/10/24.
//

import SwiftUI

struct CardReflectionView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            Image("Background 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 600)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .scaleEffect(0.9)
                .overlay {
                    ZStack {
                        Image("Logo 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180)
                        Image("Logo 2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400)
                        Image("Logo 3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 392, height: 600)
                            .blendMode(.overlay) // to compose view with overlapping views
                    }
                }
                .overlay {
                    Image("Gloss 1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .mask {
                            LinearGradient(colors: [.clear, .white,.clear, .white,.clear, .white,.clear, .white,.clear], startPoint: .topLeading, endPoint: .bottomTrailing)
                                .frame(width: 392)
                        }
                }
        }
    }
}

#Preview {
    CardReflectionView()
}
