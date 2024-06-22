//
//  WaterWidgetView.swift
//  WidgetKit-Tutorial
//
//  Created by Siddharth Kothari on 22/06/24.
//

import SwiftUI
import WidgetKit

struct WaterWidgetView: View {
    var entry: WaterProvider.Entry
        
        // 3.
        var body: some View {
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "drop")
                    Text("Tip of the day")
                }
                .font(.title3)
                .bold()
                .padding(.bottom, 8)
                
                Text(entry.waterTip)
                    .font(.caption)
                
                Spacer()
                
                HStack{
                    Spacer()
                    Text("**Last Update:** \\(entry.date.formatted(.dateTime))")
                        .font(.caption2)
                    
                }
            }
            .foregroundStyle(.white)
            
            // 4.
            .containerBackground(for: .widget){
                Color.cyan
            }
        }
}

#Preview {
    WaterWidgetView(entry: WaterEntry(date: Date(), waterTip: "test tip"))
}
