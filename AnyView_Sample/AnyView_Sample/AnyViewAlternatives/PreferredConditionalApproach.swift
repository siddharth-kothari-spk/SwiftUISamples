//
//  PreferredConditionalApproach.swift
//  AnyView_Sample
//
//  Created by Siddharth Kothari on 29/08/25.
//

import SwiftUI

// ✅ PREFERRED: Using Group for simple conditionals
struct PreferredConditionalApproach: View {
    let showAdvanced: Bool
    
    var body: some View {
        VStack {
            Text("Settings")
            
            Group {
                if showAdvanced {
                    VStack {
                        Toggle("Option 1", isOn: .constant(true))
                        Toggle("Option 2", isOn: .constant(false))
                        Slider(value: .constant(0.5))
                    }
                } else {
                    VStack {
                        Toggle("Basic Option", isOn: .constant(true))
                        Button("More Settings") { }
                    }
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
        }
    }
}

#Preview {
    PreferredConditionalApproach(showAdvanced: true)
}
