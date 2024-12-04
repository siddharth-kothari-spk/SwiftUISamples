//
//  ContentView.swift
//  BuyButtonAnimation
//
//  Created by Siddharth Kothari on 04/12/24.
//
// https://www.linkedin.com/posts/su-codee-676946321_swiftui-buy-button-animation-activity-7269309349510938625-GF6q/?utm_source=share&utm_medium=member_desktop
import SwiftUI

struct ContentView: View {
    @State var spin = false
    @State var start = false
    @State var loading = false
    @State var currentIconIndex = 0
    @State var showCheckmark = false
    @State var icons = ["gift.fill", "cart.fill", "bag.fill", "creditcard.fill", "tag.fill", "bag.fill"]
    
    var body: some View {
        ZStack {
            Group {
                Circle()
                    .frame(width: 55, height: 55)
                    .foregroundStyle(AngularGradient(gradient: Gradient(colors: [.black, .yellow]), center: .center, angle: .degrees(spin ? 360 : 0)))
                    .mask {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 55, height: 55)
                    }
            }
            .opacity(loading ? 1 : 0)
            
            if !start {
                Text("Buy now")
                    .font(.title2)
                    .foregroundStyle(.yellow)
            }
            else {
                Image(systemName: showCheckmark ? "checkmark.seal" : icons[currentIconIndex])
                    .font(showCheckmark ? .largeTitle : .title2)
                    .foregroundStyle(showCheckmark ? .green : .white)
                    .contentTransition(.symbolEffect)
            }
        }
        .frame(width: start ? 65 : 190, height: 65)
        .background(.black, in: Capsule())
        .onTapGesture {
            loading = true
            withAnimation {
                start.toggle()
            }
            if start {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: DispatchWorkItem(block: {
                    loading = false
                    withAnimation {
                        showCheckmark = true
                        spin = false
                    }
                }))
            }
        }
        .onAppear(perform: {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                spin.toggle()
            }
            
            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { timer in
                if start && !showCheckmark {
                    withAnimation {
                        currentIconIndex = (currentIconIndex + 1) % icons.count
                    }
                }
            }
        })
    }
}

#Preview {
    ContentView()
}
