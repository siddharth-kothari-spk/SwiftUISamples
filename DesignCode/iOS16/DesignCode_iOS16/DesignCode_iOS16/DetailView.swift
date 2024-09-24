//
//  DetailView.swift
//  DesignCode_iOS16
//
//  Created by Siddharth Kothari on 24/09/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            ViewThatFits {
                //ViewThatFits evaluates its child views in the order you provide them to the initializer. It selects the first child whose ideal size on the constrained axes fits within the proposed size.
                HStack(content: {
                    VStack(content: {
                        ChartView()
                        CardView()
                    })
                    VStack(content: {
                        MenuView()
                            .frame(width: 300)
                        GridView()
                            .frame(width:300)
                    })
                    
                })
                VStack(content: {
                    MenuView()
                    CardView()
                    GridView()
                })
            }
        }
       
    }
}

#Preview {
    DetailView()
}
