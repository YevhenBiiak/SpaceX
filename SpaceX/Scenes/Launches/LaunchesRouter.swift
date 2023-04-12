//
//  LaunchesRouter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import UIKit

protocol LaunchesDataStore {
    //var items: [Item] { get }
}

protocol LaunchesDataPassing {
    var dataStore: LaunchesDataStore? { get }
}

class LaunchesRouter: NSObject, LaunchesRoutingLogic, LaunchesDataPassing {
    
    weak var viewController: LaunchesViewController?
    var dataStore: LaunchesDataStore?
    
    func routeToLaunchDetails(segue: UIStoryboardSegue?) {
        
    }
}
