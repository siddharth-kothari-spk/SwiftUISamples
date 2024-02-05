//
//  Extensions.swift
//  ShimmerEffect
//
//  Created by Siddharth Kothari on 05/02/24.
//

import Foundation
import SwiftUI

/*
 we verify if view isLoading, if it is we add the Redacted and a modifier.

     Redacted is responsable for adding a gray wrapper hiding whatever is inside the view
     The Shimmer Modifier is responsable for given the loading effect to it.
 */
extension View {
    @ViewBuilder
    func shimmer(when isLoading: Binding<Bool>) -> some View {
        if isLoading.wrappedValue {
            self.modifier(Shimmer())
                .redacted(reason: isLoading.wrappedValue ? .placeholder : [])
        } else {
            self
        }
    }
}
