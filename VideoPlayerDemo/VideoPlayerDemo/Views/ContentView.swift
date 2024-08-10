//
//  ContentView.swift
//  VideoPlayerDemo
//
//  Created by Siddharth Kothari on 08/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var videoManager = VideoManager()
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(Query.allCases, id: \.self) { searchQuery in
                        QueryTag(query: searchQuery, isSelected: true)
                    }
                }
                ScrollView {
                    //VideoCard(video: previewVideo)
                    ForEach(videoManager.videos, id: \.id) { video in
                        NavigationLink {
                            VideoView(video: video)
                        } label: {
                            VideoCard(video: video)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding()
        .background(Color("AccentColor"))
        }
    }
}

#Preview {
    ContentView()
}
