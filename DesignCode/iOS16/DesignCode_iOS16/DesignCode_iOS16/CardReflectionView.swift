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
        }
    }
}

#Preview {
    CardReflectionView()
}
