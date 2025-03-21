//
//  ContentView.swift
//  Hold_Button
//
//  Created by Siddharth Kothari on 03/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isComplete = false
    @State var isSuccess = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 250, height: 50)
                    .foregroundStyle(.red.opacity(0.5))
                Rectangle()
                    .frame(width: isComplete ? 250 : 0, height: 50)
                    .foregroundStyle(isSuccess ? .gray : .red)
            }
            .clipShape(Capsule())
            
            Text(isSuccess ? "Account Deleted": "Hold to delete").bold()
        }
        .onLongPressGesture(minimumDuration: 2, maximumDistance: 50) {
            // on completion
            withAnimation {
                isSuccess = true
            }
        } onPressingChanged: { isPressing in
           if isPressing {
                withAnimation(.linear(duration: 2)) {
                    isComplete = true
                }
            }
            else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    if !isSuccess {
                        withAnimation {
                            isComplete = false
                        }
                    }
                }
            }
        }

        
    }
}

#Preview {
    ContentView()
}
