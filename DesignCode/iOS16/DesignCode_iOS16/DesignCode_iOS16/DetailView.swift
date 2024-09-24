//
//  DetailView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 24/09/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ViewThatFits {
            //ViewThatFits evaluates its child views in the order you provide them to the initializer. It selects the first child whose ideal size on the constrained axes fits within the proposed size.
            HStack(content: {
                ChartView()
            })
            VStack(content: {
                ChartView()
                CardView()
                GridView()
            })
        }
       
    }
}

#Preview {
    DetailView()
}
