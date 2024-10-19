//
//  ContentView.swift
//  AttributedString_Sample
//
//  Created by Siddharth Kothari on 19/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(attributedText)
    }
    
    private var attributedText: AttributedString {
        let sample = "iOS Developer"
        var attributed = AttributedString(sample)
        
        if let range = attributed.range(of: "iOS"){
            attributed[range].font = .body
            attributed[range].foregroundColor = .blue
        }
        
        if let range = attributed.range(of: "Developer"){
            attributed[range].font = .title
            attributed[range].foregroundColor = .red
        }
        
        return attributed
    }
}

#Preview {
    ContentView()
}
