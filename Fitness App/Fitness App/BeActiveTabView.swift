//
//  BeActiveTabView.swift
//  Fitness App
//
//  Created by Siddharth Kothari on 18/08/23.
//

import Foundation
import SwiftUI

struct BeActiveTabView: View {
    @State var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // add tab views
        }
    }
    
}

struct BeActiveTabView_Previews: PreviewProvider {
    static var previews: some View {
        BeActiveTabView()
    }
}
