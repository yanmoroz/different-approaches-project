//
//  ImageDownloader.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 26.02.2024.
//

import UIKit

final class ImageDownloader {
    static let shared = ImageDownloader()
    private let imageCache: ImageCache = ImageCacheImpl()
    
    private init() { }
}

// MARK: - Public Methods
extension ImageDownloader {
    func downloadImage(for url: URL) async throws -> UIImage {
        if let cachedImage = imageCache.image(for: url) {
            return cachedImage
        }
        
        let data = try await downloadImageData(from: url)
        guard let image = UIImage(data: data) else {
            throw ImageDownloaderError.invalidImageData
        }
        
        imageCache.insertImage(image, for: url)
        return image
    }
}

// MARK: - Private Methods
private extension ImageDownloader {
    func downloadImageData(from url: URL) async throws -> Data {
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
