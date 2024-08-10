//
//  VideoCard.swift
//  VideoPlayerDemo
//
//  Created by Siddharth Kothari on 09/08/24.
//

import SwiftUI

struct VideoCard: View {
    var video: Video
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading, content: {
                AsyncImage(url: URL(string: video.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 250)
                        .clipShape(.buttonBorder)
                    
                } placeholder: {
                    Rectangle()
                        .foregroundStyle(.gray.opacity(0.3))
                        .frame(width: 150, height: 250)
                        .clipShape(.buttonBorder)
                }
                
                VStack(alignment: .leading) {
                    Text("50 sec")
                        .font(.caption.bold())
                    
                    Text("By XYZ")
                        .font(.caption.bold())
                        .multilineTextAlignment(.leading) // so if content goes in more than 1 line it does not shift to center
                }
                .padding()
                .foregroundStyle(.white)
                .shadow(color:.black, radius: 10)
                
            })
            
            Image(systemName: "play.fill")
                .foregroundStyle(.white)
                .font(.title)
                .padding()
                .background(.thinMaterial)
                .clipShape(Circle())
        }
    }
}

#Preview {
    VideoCard(video: previewVideo)
}
