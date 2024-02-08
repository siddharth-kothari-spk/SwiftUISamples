//
//  ContentView.swift
//  BarCodeGenerator
//
//  Created by Siddharth Kothari on 08/02/24.
//

// courtsey: https://www.appcoda.com/swiftui-barcode-generator/?ck_subscriber_id=790969036

import SwiftUI


struct ContentView: View {
    @State private var inputText = ""
    var barcodeGenerator = BarCodeGenerator()
    
    var body: some View {
        VStack(alignment: .leading) {
         
            Text("Barcode Generator")
                .font(.system(size: 60, weight: .black, design: .rounded))
         
            Text("Please key in your barcode data in the text field")
                .font(.headline)
                .padding(.bottom, 20)
         
            TextField("", text: $inputText)
                .padding()
                .font(.title)
                .background(Color(.systemGray6))
         
            Spacer()
         
            VStack(spacing: 0) {
                barcodeGenerator.generateBarCode(text: inputText)
                    .resizable()
                    .scaledToFit()
         
                Text(inputText.isEmpty ? "Unknown data" : inputText)
            }
         
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
