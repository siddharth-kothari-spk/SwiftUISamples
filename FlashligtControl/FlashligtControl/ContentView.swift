//
//  ContentView.swift
//  FlashligtControl
//
//  Created by Siddharth Kothari on 20/12/24.
//
// https://www.learnandcodewithenid.com/e/BAh7BjoWZW1haWxfZGVsaXZlcnlfaWRsKwjgZJN2BgA%3D--e1b54f7cad9604e4c0e95c5baa940ab9dc937ed3?skip_click_tracking=true

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var lightSwitch = false
    var body: some View {
        Button("Light Switch") {
            if let device = AVCaptureDevice.default(for: .video), device.hasTorch {
                
                if lightSwitch {
                    do {
                        try device.lockForConfiguration()
                        device.torchMode = .on
                        device.unlockForConfiguration()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
                else {
                    do {
                        try device.lockForConfiguration()
                        device.torchMode = .off
                        device.unlockForConfiguration()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
        .frame(width: 200, height: 50)
        .background {
            Capsule(style: .continuous)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                }
        }
        .padding()
        .onTapGesture {
            lightSwitch.toggle()
        }
    }
}

#Preview {
    ContentView()
}
