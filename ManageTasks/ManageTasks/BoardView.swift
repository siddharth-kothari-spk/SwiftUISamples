//
//  BoardView.swift
//  ManageTasks
//
//  Created by Siddharth Kothari on 21/07/23.
//

import Foundation
import SwiftUI

struct BoardView: View {
    
    let title: String
    let tasks: [BoardTask]
    let isTargeted: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote.bold())

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(isTargeted ? Color.teal : Color(.secondarySystemFill))

                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks, id: \.id) { task in
                        Text(task.title)
                            .padding(12)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(task)
                        // task needs to conform to Transferable protocol. task is just a string here and 'String' conforms to Transferable by default
                    }

                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}
