//
//  TransitionView.swift
//  SF Symbols animation
//
//  Created by Siddharth Kothari on 02/10/23.
//

import SwiftUI

struct TransitionView: View {
  @State private var symbolIsHidden = true
  private var buttonTitle: String {
      return symbolIsHidden ? "Show" : "Hide"
  }
  
  var body: some View {
    VStack {
      if !symbolIsHidden {
        Image(systemName: "wifi.router")
              .transition(.symbolEffect(.appear)).padding()
      }
      
      Button(buttonTitle) {
        symbolIsHidden.toggle()
      }
    }
  }
}

#Preview {
    TransitionView()
}
