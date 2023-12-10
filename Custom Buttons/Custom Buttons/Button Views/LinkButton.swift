//
//  LinkButton.swift
//  Custom Buttons
//
//  Created by Siddharth Kothari on 10/12/23.
//

import SwiftUI

struct LinkButton: View{
    var body: some View {
        Button{
            print("LinkButton pressed")
            // here we can start the open the url
        } label: {
            Text("Link Button")
                .foregroundStyle(.black)
                .font(.system(size: Constants.customFontSize, weight: Constants.customFontWeight))
                .frame(maxWidth: .infinity, minHeight: Constants.customHeight)
                .underline(true)
        }
    }
}

#Preview {
    LinkButton()
}
