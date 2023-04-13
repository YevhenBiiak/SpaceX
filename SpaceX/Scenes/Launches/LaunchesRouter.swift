//
//  LaunchesRouter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import UIKit

protocol LaunchesDataStore {
    var launches: [Launch] { get }
}

class LaunchesRouter: NSObject, LaunchesRoutingLogic {
    
    weak var viewController: LaunchesViewController?
    var dataStore: LaunchesDataStore?
    
    func routeToLaunchDetails(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! LaunchDetailsViewController
            var destinationDS = destinationVC.interactor as! LaunchDetailsDataStore
            passDataLaunchDetails(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "LaunchDetailsViewController") as! LaunchDetailsViewController
            var destinationDS = destinationVC.interactor as! LaunchDetailsDataStore
            passDataLaunchDetails(source: dataStore!, destination: &destinationDS)
            navigateToLaunchDetails(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToLaunchDetails(source: LaunchesViewController, destination: LaunchDetailsViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataLaunchDetails(source: LaunchesDataStore, destination: inout LaunchDetailsDataStore) {
        if let selectedIndex = viewController?.collectionView.indexPathsForSelectedItems?.first?.item {
            destination.launch = source.launches[selectedIndex]
        }
    }
}
