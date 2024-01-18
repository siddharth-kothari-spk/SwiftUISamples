//
//  ContentView.swift
//  API Key Security
//
//  Created by Siddharth Kothari on 18/01/24.
//

// courtsey: https://medium.com/@kodekarim/api-key-security-in-ios-master-on-demand-protection-strategies-1aadd3c70413

import SwiftUI

struct ContentView: View {
    
    @State private var keys: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, keys!,\n \(keys)")
            
            Button("Show API Keys", action: {
                showKeys()
            })
        }
        .padding()
    }
    
    func showKeys() {
         keys = """
                \(KeyConstants.APIKeys.serviceA)
                \(KeyConstants.APIKeys.serviceB)
                """
    }
}

#Preview {
    ContentView()
}
