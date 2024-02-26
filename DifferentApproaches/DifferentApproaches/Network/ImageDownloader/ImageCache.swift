//
//  ImageCache.swift
//  DifferentApproaches
//
//  Created by Yan Moroz on 26.02.2024.
//

import UIKit

protocol ImageCache: AnyObject {
    func image(for url: URL) -> UIImage?
    func insertImage(_ image: UIImage?, for url: URL)
    func removeImage(for url: URL)
    func removeAllImage()
    
    subscript(_ url: URL) -> UIImage? { get set }
}

final class ImageCacheImpl {
    private let lock = NSLock()
    private let config: Config
    
    private lazy var imageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.countLimit = config.countLimit
        return cache
    }()
    
    private lazy var decodedImageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.totalCostLimit = config.memoryLimit
        return cache
    }()
    
    init(config: Config = .default) {
        self.config = config
    }
    
    struct Config {
        let countLimit: Int
        let memoryLimit: Int
        
        static let memoryLimit = 1024 * 1024 * 100 // 100MB
        static let `default` = Config(countLimit: 100, memoryLimit: memoryLimit)
    }
}

// MARK: ImageCache
extension ImageCacheImpl: ImageCache {
    func image(for url: URL) -> UIImage? {
        defer { lock.unlock() }
        
        lock.lock()
        if let decodedImage = decodedImageCache.object(forKey: url as AnyObject) as? UIImage {
            return decodedImage
        }
        
        if let image = imageCache.object(forKey: url as AnyObject) as? UIImage {
            let decodedImage = image.decodedImage()
            decodedImageCache.setObject(image as AnyObject, forKey: url as AnyObject, cost: decodedImage.diskSize)
            return decodedImage
        }
        
        return nil
    }
    
    func insertImage(_ image: UIImage?, for url: URL) {
        guard let image else { return }
        defer { lock.unlock() }
        
        let decodedImage = image.decodedImage()
        lock.lock()
        imageCache.setObject(decodedImage, forKey: url as AnyObject, cost: 1)
        decodedImageCache.setObject(image as AnyObject, forKey: url as AnyObject, cost: decodedImage.diskSize)
    }
    
    func removeImage(for url: URL) {
        defer { lock.unlock() }
        
        lock.lock()
        imageCache.removeObject(forKey: url as AnyObject)
        decodedImageCache.removeObject(forKey: url as AnyObject)
    }
    
    func removeAllImage() {
        defer { lock.unlock() }
        
        lock.lock()
        imageCache.removeAllObjects()
        decodedImageCache.removeAllObjects()
    }
    
    subscript(url: URL) -> UIImage? {
        get {
            return image(for: url)
        }
        set {
            return insertImage(newValue, for: url)
        }
    }
}
