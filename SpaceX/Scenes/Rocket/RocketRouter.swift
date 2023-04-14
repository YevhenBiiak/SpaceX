//
//  RocketRouter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 13.04.2023.
//

import UIKit

protocol RocketDataStore {
    var name: String { get set }
}

class RocketRouter: NSObject, RocketRoutingLogic {
    
    weak var viewController: RocketViewController?
    var dataStore: RocketDataStore?
    
    // MARK: Routing
    
    func routeToSomewhere(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! RocketViewController
            var destinationDS = destinationVC.interactor as! RocketDataStore
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "RocketViewController") as! RocketViewController
            var destinationDS = destinationVC.interactor as! RocketDataStore
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
            navigateToSomewhere(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToSomewhere(source: RocketViewController, destination: RocketViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToSomewhere(source: RocketDataStore, destination: inout RocketDataStore) {
        destination.name = source.name
    }
}
