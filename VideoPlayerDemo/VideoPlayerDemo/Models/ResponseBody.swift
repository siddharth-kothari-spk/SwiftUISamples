//
//  ResponseBody.swift
//  VideoPlayerDemo
//
//  Created by Siddharth Kothari on 10/08/24.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(ResponseBody.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ResponseBody: Codable {
    let page, perPage, totalResults: Int
    let url: String
    let videos: [Video]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalResults = "total_results"
        case url, videos
    }
}

// MARK: - Video
struct Video: Codable {
    let id, width, height: Int
    let url: String
    let image: String
    let duration: Int
    let user: User
    let videoFiles: [VideoFile]
    let videoPictures: [VideoPicture]

    enum CodingKeys: String, CodingKey {
        case id, width, height, url, image, duration, user
        case videoFiles = "video_files"
        case videoPictures = "video_pictures"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let name: String
    let url: String
}

// MARK: - VideoFile
struct VideoFile: Codable {
    let id: Int
    let quality, fileType: String
    let width, height: Int?
    let link: String

    enum CodingKeys: String, CodingKey {
        case id, quality
        case fileType = "file_type"
        case width, height, link
    }
}

// MARK: - VideoPicture
struct VideoPicture: Codable {
    let id: Int
    let picture: String
    let nr: Int
}

