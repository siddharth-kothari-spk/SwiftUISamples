//
//  ContentView.swift
//  CardFlipAnimation
//
//  Created by Siddharth Kothari on 27/11/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_iosdeveloper-swiftui-swift-activity-7266793410198429696-ZsUs/
import SwiftUI

struct ContentView: View {
    @State var flip = false
    @State var flip2 = false
    
    var body: some View {
        ZStack {
            Image(.card1)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 400)
            
            Image(.card2)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 400)
        }
        .clipShape(.rect(cornerRadius: 24))
    }
}

#Preview {
    ContentView()
}
