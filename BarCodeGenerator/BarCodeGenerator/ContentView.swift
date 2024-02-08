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
    var barcodeGenerator = BarcodeGenerator()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
