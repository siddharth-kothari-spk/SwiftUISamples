//
//  ContentView.swift
//  StackView_Animation
//
//  Created by Siddharth Kothari on 15/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var tasks: [DataModel] = [
        DataModel(title: "Task A", isComplete: false),
        DataModel(title: "Task B", isComplete: false),
        DataModel(title: "Task C", isComplete: false),
        DataModel(title: "Task D", isComplete: false),
        DataModel(title: "Task E", isComplete: false),
        DataModel(title: "Task F", isComplete: false),
    ]
    @State var show = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12, content: {
                ForEach(tasks.indices, id: \.self) { index in
                    let task = tasks[index]
                    let scaleValue = 1.0 - (CGFloat(index) * 0.02)
                    let opacityValue = 1.0 - (CGFloat(index) * 0.2)
                    
                    HStack(content: {
                        Text(task.title)
                            .strikethrough(task.isComplete, color: .white)
                        
                        Spacer()
                        
                        Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
                            .font(.title2)
                            .contentTransition(.symbolEffect)
                    })
                    .bold()
                    .padding(.horizontal)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .opacity(index == 0 ? 1 : (show ? 1 : opacityValue))
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 25.0))
                    .zIndex(Double(-1 * index))
                    .scaleEffect(show ? 1 : scaleValue)
                    .opacity(show ? 1 : opacityValue)
                    .offset(y: CGFloat(show ? 0 * index : -56 * index))
                }
            })
            .onTapGesture {
                withAnimation {
                    show.toggle()
                }
            }
        }
        .frame(height: show ? nil : 50, alignment: .top)
    }
}

#Preview {
    ContentView()
}
