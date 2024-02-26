//
//  ImageCache.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 26.02.2024.
//

import UIKit

class ImageCache {
    private var cache: [URL: UIImage] = [:]
    
    func cacheImage(_ image: UIImage, for url: URL) {
        cache[url] = image
    }

    func image(for url: URL) -> UIImage? {
        return cache[url]
    }
}
