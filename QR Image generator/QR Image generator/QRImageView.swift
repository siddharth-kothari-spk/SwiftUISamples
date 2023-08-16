//
//  QRImageView.swift
//  QR Image generator
//
//  Created by Siddharth Kothari on 16/08/23.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRImageView: View {
    let qrCode: String
    
    @State private var image: UIImage?
    
    var body: some View {
        ZStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .interpolation(.none)
                    .frame(width: 210, height: 210)
            }
        }
        .onAppear{
            generateImage()
        }
    }
    
    private func generateImage() {
        guard image == nil else {
            return
        }
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(qrCode.utf8)
        
        guard let outputImage = filter.outputImage, let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return
        }
        
        self.image = UIImage(cgImage: cgImage)
    }
    
}
