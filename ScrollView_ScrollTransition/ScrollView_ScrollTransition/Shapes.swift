//
//  Shapes.swift
//  ScrollView_ScrollTransition
//
//  Created by Siddharth Kothari on 20/10/23.
//

import Foundation
import SwiftUI

struct Shapes: Identifiable {
  let id = UUID()
  let title: String
  let color: Color
  
  static let dummyShapes: [Shapes] = [
    Shapes(title: "a.square.fill", color: .red),
    Shapes(title: "b.circle", color: .green),
    Shapes(title: "c.square.fill", color: .blue),
    Shapes(title: "d.circle", color: .yellow),
    Shapes(title: "e.square.fill", color: .gray),
    Shapes(title: "f.circle", color: .purple),
  ]
}
