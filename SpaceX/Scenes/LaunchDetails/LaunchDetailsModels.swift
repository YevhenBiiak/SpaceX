//
//  LaunchDetailsModels.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 12.04.2023.
//

import UIKit

enum LaunchDetails {
    
    // MARK: Use cases
    
    enum ShowLaunch {
        struct Request {}
        struct Response {
            let launch: Launch
        }
        struct ViewModel {
            struct Rocket {
                let id: String
                let name: String
                let description: String
                let height: String
                let diameter: String
                let mass: String
                let image: UIImage
            }
            
            let id: String
            let date: String
            let upcoming: Bool
            let mission: String
            let description: String
            let rocket: Rocket
            let imageURLs: [URL]
        }
    }
}
