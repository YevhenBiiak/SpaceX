//
//  HomeModels.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import UIKit

enum Home {
    
    struct Item {
        var id = String()
        let name: String
        let description: String
        var image: UIImage?
    }
    
    // MARK: Use cases
    
    enum FetchItems {
        struct Request {}
        struct Response {
            var items: [Item]
        }
        struct ViewModel {
            let id: String
            let title: String
            let description: String
            let image: UIImage
        }
    }
}
