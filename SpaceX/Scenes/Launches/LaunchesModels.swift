//
//  LaunchesModels.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import UIKit

enum Launches {
    
    struct Item {
        var id: String
        let date: Date
        let mission: String
        var imageURLs: [URL]
    }
    
    // MARK: Use cases
    
    enum FetchLaunches {
        struct Request {}
        struct Response {
            var launches: [Item]
        }
        struct ViewModel {
            let id: String
            let date: String
            let title: String
            let imageURL: URL?
        }
    }
}

