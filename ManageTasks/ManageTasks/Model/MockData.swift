//
//  MockData.swift
//  ManageTasks
//
//  Created by Siddharth Kothari on 21/07/23.
//

import Foundation

struct MockData {
    static let mockOne = BoardTask(id: UUID(), title: "@Observable Migration", owner: "Siddharth Kothari", note: "mockOne placeholder")
    static let mockTwo = BoardTask(id: UUID(), title: "@Keyframe Animations", owner: "Siddharth Kothari", note: "mockTwo placeholder")
    static let mockThree = BoardTask(id: UUID(), title: "Migrate to Swift Data", owner: "Siddharth Kothari", note: "mockThree placeholder")

}
