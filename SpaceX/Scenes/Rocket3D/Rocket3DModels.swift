//
//  Rocket3DModels.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 18.04.2023.
//

import UIKit

enum Rocket3D {
    
    // MARK: Use cases
    
    enum Show3DModel {
        struct Request {}
        struct Response {
            let filename: String
        }
        struct ViewModel {
            let filename: String
        }
    }
}
