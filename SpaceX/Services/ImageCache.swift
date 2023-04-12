//
//  ImageCache.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 10.04.2023.
//

import UIKit

class ImageCache {
    
    static let shared = ImageCache()
    
    private let cache = NSCache<NSString, UIImage>()
    
    func get(for url: URL?) -> UIImage? {
        guard let url else { return nil }
        return cache.object(forKey: url.absoluteString as NSString)
    }
    
    func set(_ image: UIImage?, for url: URL?) {
        guard let image, let url else { return }
        cache.setObject(image, forKey: url.absoluteString as NSString)
    }
}
