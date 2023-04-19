//
//  ImageRequest.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import UIKit

struct ImageRequest {
    var url: URL?
    
    init(url: URL?) {
        self.url = url
    }
}

extension ImageRequest: NetworkRequest {
    
    func decode(_ data: Data) throws -> UIImage? {
        UIImage(data: data)
    }
}
