//
//  HomeRouter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import UIKit

protocol HomeDataStore {
    //var items: [Model] { get }
}

class HomeRouter: NSObject, HomeRoutingLogic {
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    func routeToRocket(segue: UIStoryboardSegue?) {
        
    }
    
    func routeToLaunches(segue: UIStoryboardSegue?) {
        
    }
}
