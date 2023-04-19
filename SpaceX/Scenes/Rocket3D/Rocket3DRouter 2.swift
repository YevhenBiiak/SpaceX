//
//  Rocket3DRouter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 18.04.2023.
//

import UIKit

protocol Rocket3DDataStore {
    var rocketID: String! { get set }
}

class Rocket3DRouter: NSObject, Rocket3DRoutingLogic {
    
    weak var viewController: Rocket3DViewController?
    var dataStore: Rocket3DDataStore?
    
    // MARK: Routing
    
    // MARK: Navigation
    
    // MARK: Passing data
    
}
