//
//  HomeRouter.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 08.04.2023.
//

import UIKit

protocol HomeDataStore {
    var rockets: [Home.Rocket] { get }
}

class HomeRouter: NSObject, HomeRoutingLogic {
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    func routeToRocket(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! RocketViewController
            var destinationDS = destinationVC.interactor as! RocketDataStore
            passDataLaunchDetails(source: dataStore!, destination: &destinationDS)
        } else {
            let destinationVC = UIStoryboard.main.instance(of: RocketViewController.self)
            var destinationDS = destinationVC.interactor as! RocketDataStore
            passDataLaunchDetails(source: dataStore!, destination: &destinationDS)
            navigateToLaunchDetails(source: viewController!, destination: destinationVC)
        }
    }
    
    func routeToLaunches(segue: UIStoryboardSegue?) {
        
    }
    
    // MARK: Navigation
    
    func navigateToLaunchDetails(source: HomeViewController, destination: RocketViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataLaunchDetails(source: HomeDataStore, destination: inout RocketDataStore) {
        if let selectedIndex = viewController?.tableView.indexPathForSelectedRow?.row {
            destination.rocketID = source.rockets[selectedIndex].id
        }
    }
}
