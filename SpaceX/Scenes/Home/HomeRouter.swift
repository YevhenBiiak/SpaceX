//
//  HomeRouter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import UIKit

protocol HomeDataStore {
    //var items: [Item] { get }
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    func routeToRocket(segue: UIStoryboardSegue?) {
        
    }
    
    func routeToLaunches(segue: UIStoryboardSegue?) {
        
    }
}
