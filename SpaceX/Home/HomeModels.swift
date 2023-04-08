//
//  HomeModels.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import UIKit

enum Home {
    
    struct Item {
        let title: String
        var image: UIImage?
    }
    
    // MARK: Use cases
    
    enum FetchItems {
        struct Request {}
        struct Response {
            var items: [Item]
        }
        struct ViewModel {
            struct Item {
                let title: String
                let image: UIImage
            }
            
            let title: String
            let image: UIImage
//            var items: [Item]
        }
    }
}
