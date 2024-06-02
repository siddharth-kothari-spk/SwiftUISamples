//
//  EnumConfigView.swift
//  Enum_Manage_Configs
//
//  Created by Siddharth Kothari on 02/06/24.
//

import SwiftUI

import SwiftUI

struct EnumConfigView: View {
    var body: some View {
        #if DEBUG
        let config = EnvironmentConfig.Development.self
        #else
        let config = EnvironmentConfig.Production.self
        #endif
        
        VStack(spacing: 50) {
            Text("Current Config")
                .foregroundStyle(Color.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16))
            
            Text("BASE URL: \(config.baseUrl)")
                .foregroundStyle(Color.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16))

            
            Text("API KEY : \(config.APIKEY)")
                .foregroundStyle(Color.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    EnumConfigView()
}
