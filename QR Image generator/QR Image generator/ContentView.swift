//
//  ContentView.swift
//  QR Image generator
//
//  Created by Siddharth Kothari on 16/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            QRImageView(qrCode: "SiddharthKothari")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
