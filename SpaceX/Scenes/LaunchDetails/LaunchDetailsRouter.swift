//
//  LaunchDetailsRouter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 12.04.2023.
//

import UIKit

protocol LaunchDetailsDataStore {
    var launch: Launch! { get set }
}

class LaunchDetailsRouter: NSObject, LaunchDetailsRoutingLogic {
    
    weak var viewController: LaunchDetailsViewController?
    var dataStore: LaunchDetailsDataStore?
    
    // MARK: Routing
    
    func routeToRocket(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! RocketViewController
            var destinationDS = destinationVC.interactor as! RocketDataStore
            passDataToRocket(source: dataStore!, destination: &destinationDS)
        } else {
            let destinationVC = UIStoryboard.main.instance(of: RocketViewController.self)
            var destinationDS = destinationVC.interactor as! RocketDataStore
            passDataToRocket(source: dataStore!, destination: &destinationDS)
            navigateToRocket(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToRocket(source: LaunchDetailsViewController, destination: RocketViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToRocket(source: LaunchDetailsDataStore, destination: inout RocketDataStore) {
        destination.rocketID = dataStore?.launch.rocket.id
    }
}
