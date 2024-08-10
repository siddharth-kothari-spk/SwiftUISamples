//
//  VideoView.swift
//  VideoPlayerDemo
//
//  Created by Siddharth Kothari on 10/08/24.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var video: Video
    @State private var player = AVPlayer()
    
    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea(edges: .all)
            .onAppear(perform: {
                if let link = video.videoFiles.first?.link, 
                    let url = URL(string: link) {
                    player = AVPlayer(url: url)
                    player.play()
                }
            })
    }
}

#Preview {
    VideoView(video: previewVideo)
}
