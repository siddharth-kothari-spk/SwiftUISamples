//
//  VideoManager.swift
//  VideoPlayerDemo
//
//  Created by Siddharth Kothari on 09/08/24.
//

import Foundation

enum Query: String, CaseIterable {
    case nature, animals, people, ocean, food
}

class VideoManager: ObservableObject {
    @Published private(set) var videos: [Video] = []
    @Published var selectedQuery: Query = Query.animals {
        didSet {
            Task.init {
                await findVideos(topic:selectedQuery)
            }
        }
    }
    
    init() {
        // we need to call findVideos in a task as it is an async function
        Task.init {
            await findVideos(topic:selectedQuery)
        }
    }
    func findVideos(topic: Query) async {
        do {
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(topic)&per_page=10&orientation=portrait") else {
                fatalError("No url to fetch videos")
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue(Utilities.apiKey(), forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                fatalError("Not a 200 response")
            }
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(ResponseBody.self, from: data)
            // Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.
            DispatchQueue.main.async {
                self.videos = []
                self.videos = decodedData.videos
            }
            
        } catch (let error) {
            print("Error while fetching videos for query: \(topic) , \(error)")
        }
    }
}
