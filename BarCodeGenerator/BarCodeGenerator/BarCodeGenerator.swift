//
//  BarCodeGenerator.swift
//  BarCodeGenerator
//
//  Created by Siddharth Kothari on 08/02/24.
//

import Foundation
import CoreImage.CIFilterBuiltins

struct BarCodeGenerator {
    let context = CIContext()
    let generator = CIFilter.code128BarcodeGenerator()
    
    func generateBarCode(text: String) -> Image {
        generator.message = Data(text)
        
        if let outputImage = generator.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            return Image(uiImage: uiImage)
        }
        return Image(systemName: "barcode")
    }
}
