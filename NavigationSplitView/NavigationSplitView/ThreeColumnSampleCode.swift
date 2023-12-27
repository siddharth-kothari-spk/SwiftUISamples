//
//  ThreeColumnSampleCode.swift
//  NavigationSplitView
//
//  Created by Siddharth Kothari on 27/12/23.
//

import SwiftUI

struct ThreeColumnSampleCode: View {
    @State private var firstSelectedDataItem: DataModel?
        @State private var secondSelectedDataItem: DataModel?
        @State private var thirdSelectedDataItem: DataModel?
        
        var body: some View {
            NavigationSplitView {
                List(SampleData.firstScreenData, selection: $firstSelectedDataItem) { item in
                    NavigationLink(item.text, value: item)
                }
                .navigationTitle("Sidebar")
            } content: {
                VStack(alignment: .leading) {
                    if firstSelectedDataItem != nil {
                        Text("Previously Selected Item: \(firstSelectedDataItem!.text)")
                    }
                    List(SampleData.secondScreenData, selection: $secondSelectedDataItem) { item in
                        NavigationLink(item.text, value: item)
                    }
                    .navigationTitle("Content")
                }.padding()
            } detail: {
                VStack(alignment: .leading) {
                    if secondSelectedDataItem != nil {
                        Text("Previously Selected Item: \(secondSelectedDataItem!.text)")
                            .padding()
                    }
                    List(SampleData.lastScreenData, selection: $thirdSelectedDataItem) { item in
                        Text(item.text)
                    }
                }
                .navigationTitle("Detail")
            }
        }
}

#Preview {
    ThreeColumnSampleCode()
}
