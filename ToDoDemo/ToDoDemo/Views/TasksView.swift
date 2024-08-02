//
//  TasksView.swift
//  ToDoDemo
//
//  Created by Siddharth Kothari on 02/08/24.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        VStack {
            Text("My tasks")
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.259, saturation: 0.92, brightness: 0.907, opacity: 0.685))


    }
}

#Preview {
    TasksView()
}
