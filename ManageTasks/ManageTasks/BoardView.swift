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
    let tasks: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote.bold())

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(.secondarySystemFill))

                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                            .padding(12)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                    }

                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}
