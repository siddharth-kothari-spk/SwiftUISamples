//
//  OnFirstAppearModifier.swift
//  LogicOnlyOnceOnViewAppear
//
//  Created by Siddharth Kothari on 09/10/23.
//

import Foundation
import SwiftUI

public struct OnFirstAppearModifier: ViewModifier {

    private let onFirstAppearAction: () -> ()
    @State private var hasAppeared = false
    
    public init(_ onFirstAppearAction: @escaping () -> ()) {
        self.onFirstAppearAction = onFirstAppearAction
    }
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                guard !hasAppeared else { return }
                hasAppeared = true
                onFirstAppearAction()
            }
    }
}

extension View {
    func onFirstAppear(_ onFirstAppearAction: @escaping () -> ()) -> some View {
        return modifier(OnFirstAppearModifier(onFirstAppearAction))
    }
}
  
