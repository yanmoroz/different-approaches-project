//
//  ImageDownloader.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 26.02.2024.
//

import Foundation

enum ImageDownloader {
    static func downloadImageData(from url: URL) async throws -> Data {
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
