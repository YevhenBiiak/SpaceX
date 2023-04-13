//
//  Launch.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 12.04.2023.
//

import Foundation

struct Launch {
    struct Rocket {
        let id: String
        let name: String
        let description: String
        let height: Double
        let diameter: Double
        let mass: Int
    }
    
    let id: String
    let date: Date
    let upcoming: Bool
    let mission: String
    let description: String
    let rocket: Rocket
    let imageURLs: [URL]
}
