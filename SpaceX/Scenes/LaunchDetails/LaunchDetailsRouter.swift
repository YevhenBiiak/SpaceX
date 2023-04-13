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
    
    func routeToSomewhere(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! LaunchDetailsViewController
            var destinationDS = destinationVC.interactor as! LaunchDetailsDataStore
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "LaunchDetailsViewController") as! LaunchDetailsViewController
            var destinationDS = destinationVC.interactor as! LaunchDetailsDataStore
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
            navigateToSomewhere(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToSomewhere(source: LaunchDetailsViewController, destination: LaunchDetailsViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToSomewhere(source: LaunchDetailsDataStore, destination: inout LaunchDetailsDataStore) {
//        destination.name = source.name
    }
}
