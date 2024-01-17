//
//  HalfSheetHelper.swift
//  HalfSheet
//
//  Created by Siddharth Kothari on 17/01/24.
//

import Foundation
import SwiftUI

// UIKit Integration...
struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    var sheetView: SheetView
    @Binding var showSheet: Bool
    let controller = UIViewController()

    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context:
        Context)
    {
        if showSheet {
            // presenting Modal View....
            let sheetController = CustomHostingController(rootView: sheetView)
            uiViewController.present(sheetController, animated: true) {
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
    }
}
