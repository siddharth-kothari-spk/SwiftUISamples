//
//  ContentView.swift
//  HalfSheet
//
//  Created by Siddharth Kothari on 17/01/24.
//

// courtsey: https://21zerixpm.medium.com/swiftuis-half-sheet-for-sleek-user-interfaces-c3e77001d96f

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


extension View {
    // MARK: For bottom Sheet

    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheeView: @escaping () -> SheetView) -> some View {
        return background {
            HalfSheetHelper(sheetView: sheeView(), showSheet: showSheet)
        }
    }
}