//
//  HomeModels.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import Foundation

enum Home {
    
  // MARK: Use cases
    
    enum FetchItems {
        struct Request {}
        struct Response {
            var items: [Item]
        }
        struct ViewModel {
            var items: [Item]
        }
    }
}
