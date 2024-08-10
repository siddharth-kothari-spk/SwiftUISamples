//
//  ContentView.swift
//  VideoPlayerDemo
//
//  Created by Siddharth Kothari on 08/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var videoManager = VideoManager()
    var columns = [GridItem(.adaptive(minimum: 150), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(Query.allCases, id: \.self) { searchQuery in
                        QueryTag(query: searchQuery, isSelected: videoManager.selectedQuery == searchQuery)
                            .onTapGesture(perform: {
                                videoManager.selectedQuery = searchQuery
                            })
                    }
                }
                ScrollView {
                    if videoManager.videos.isEmpty {
                        ProgressView()
                    }
                    else {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(videoManager.videos, id: \.id) { video in
                                NavigationLink {
                                    VideoView(video: video)
                                } label: {
                                    VideoCard(video: video)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding()
        .background(Color("AccentColor"))
        .toolbar(.hidden)
        }
    }
}

#Preview {
    ContentView()
}
