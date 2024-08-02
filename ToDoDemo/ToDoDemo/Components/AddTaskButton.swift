//
//  AddTaskButton.swift
//  ToDoDemo
//
//  Created by Siddharth Kothari on 02/08/24.
//

import SwiftUI

struct AddTaskButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundStyle(Color(.blue))
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
        }
        .frame(height: 50)
        
    }
}

#Preview {
    AddTaskButton()
}
