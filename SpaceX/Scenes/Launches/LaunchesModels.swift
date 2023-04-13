//
//  LaunchesModels.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import UIKit

enum Launches {
    
    // MARK: Use cases
    
    enum FetchLaunches {
        struct Request {}
        struct Response {
            var launches: [Launch]
        }
        struct ViewModel {
            let id: String
            let date: String
            let title: String
            let imageURL: URL?
        }
    }
}

