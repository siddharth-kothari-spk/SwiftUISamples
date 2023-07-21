//
//  BoardTask.swift
//  ManageTasks
//
//  Created by Siddharth Kothari on 21/07/23.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

// 2 steps for making an object eligible for drag and drop
// i) conform to Transferable
// ii) create custon UniformTypeIdentifier

struct BoardTask:Codable {
    let id: UUID
    let title: String
    let owner: String
    let note: String
}

extension BoardTask: Transferable {
  //  typealias Representation = <#type#> // Codable , Data , Type representations available
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .boardTask)
    }
}


extension UTType {
    static let boardTask = UTType(exportedAs: "com.siddharthkothari.boardTask")
}
