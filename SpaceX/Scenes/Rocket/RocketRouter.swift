//
//  RocketRouter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import UIKit

protocol RocketDataStore {
    var rocketID: String! { get set }
}

class RocketRouter: NSObject, RocketRoutingLogic {
    
    weak var viewController: RocketViewController?
    var dataStore: RocketDataStore?
    
    // MARK: Routing
    
    func routeToRocket3D(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! Rocket3DViewController
            var destinationDS = destinationVC.interactor as! Rocket3DDataStore
            passDataToRocket3D(source: dataStore!, destination: &destinationDS)
        } else {
            let destinationVC = UIStoryboard.main.instance(of: Rocket3DViewController.self)
            var destinationDS = destinationVC.interactor as! Rocket3DDataStore
            passDataToRocket3D(source: dataStore!, destination: &destinationDS)
            navigateToRocket3D(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToRocket3D(source: RocketViewController, destination: Rocket3DViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToRocket3D(source: RocketDataStore, destination: inout Rocket3DDataStore) {
        destination.rocketID = source.rocketID
    }
}
