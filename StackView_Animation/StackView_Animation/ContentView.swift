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
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
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
